Open Coding 4
=============

Goal
----
In this session, we'll use ``gridfile`` to create a data catalogue for climate model output.


Step 1: Create ``.grid`` file
-----------------------------
We'll use the ``gridfile.new`` command again to create a new catalogue for our climate model dataset. As a reminder, the syntax is::

    grid = gridfile.new(filename, metadata)

Climate model output often spans multiple data files, so be sure that the **metadata** input defines the scope of the entire dataset.

.. note::
    DASH supports the ``var`` dimensions for different climate variables, so you can group multiple climate variables in the same catalogue. However, sometimes it's easier to create separate catalogues for different variables - particularly when applying unit conversions or other data adjustments.

    Ultimately, there's no "correct" way. Use whichever style works best for you.

*Demo*
++++++
In the demo, we have climate model output for surface temperatures. This output is arranged on a global latitude-longitude grid over time. Time proceeds from 850 CE to 2005 CE at monthly resolution. The output is split over two NetCDF files with the first 1000 years of output in the first file, and the remaining years in the second file.

We'll use the latitude and longitude metadata from the NetCDF files, but we'll create custom metadata for the time dimension using Matlab's ``datetime`` format. We'll save the catalogue in a file named "temperature-cesm.grid"::

    % Get the output files
    outputFile1 = 'b.e11.BLMTRC5CN.f19_g16.002.cam.h0.TREFHT.085001-184912.nc';
    outputFile2 = 'b.e11.BLMTRC5CN.f19_g16.002.cam.h0.TREFHT.185001-200512.nc';

    % Define metadata that spans the climate model output dataset
    lat = ncread(outputFile1, 'lat');
    lon = ncread(outputFile1, 'lon');
    time = datetime(850,1,15):calmonths(1):datetime(2005,12,15);

    % Create a metadata object
    metadata = gridMetadata("lat", lat, "lon", lon, "time", time);
    metadata = metadata.addAttributes("Units", "Kelvin", "Model", "CESM 1.0");

    % Use the metadata to initialize a new gridfile catalgoue
    file = "temperature-cesm.grid";
    gridfile.new(file, metadata);


Step 2: Add data sources
------------------------
We'll again use the ``gridfile.add`` command to add data source files to the catalogue. We'll need to call the command once for each data file. As a reminder, the syntaxes are::

    obj.add(type, filename, variable, dimensions, metadata)   % NetCDF and MAT-file

    obj.add("text", filename, dimensions, metadata, .., options, ..)  % Delimited text files

Remember that the metadata object for each data file should only have metadata values for the data subset in the file. Also recall that the metadata should include values for each dimension in the ``.grid`` catalogue. The ``gridMetadata.index`` command can be useful for extracting metadata subsets from the gridfile's metadata.

.. important::
    If you're dataset uses tripolar coordinates or another non-rectilinear coordinate system, please see the next section.


*Merged dimensions / Tripolar coordinates*
++++++++++++++++++++++++++++++++++++++++++
The ``gridfile`` class requires each element along a data dimension to have unique, fixed metadata. However, some climate model coordinate systems don't fall neatly into this paradigm, and so an additional step may be required to add model output to a ``.grid`` catalogue.

This often occurs for variables on tripolar spatial grids. Tripolar output is often organized as a 2D (longitude x latitude) spatial grid, but spatial metadata is not fixed at a given point along either data dimension. For example, the latitude coordinate at (latitude_j, longitude_k) is typically not the same as at (latitude_j, longitude_k+1). Essentially, these spatial grids describe values at a set of unique (latitude, longitude) points, rather than values on a rectilinear (latitude x longitude) grid.

To facilitate the use of such grids, ``gridfile`` allows users to merge multiple data file dimensions into a single, vectorized dimension within a ``.grid`` catalogue. For example, consider our tripolar (latitude x longitude) spatial grid. As noted, this spatial grid represents a collection of unique (latitude, longitude) points, and this matches the description of the ``site`` dimension, rather than distinct ``lat`` and ``lon`` dimensions. As such, we should merge the latitude and longitude dimensions of the data file into a single ``site`` dimension for the ``.grid`` catalogue.

As a reminder, the syntax for adding a data source file is::

    obj.add(type, filename, variable, dimensions, metadata)

To merge data file dimensions, you should use a repeated dimension name in the **dimensions** input. The **dimensions** input should still have one element per data file dimension, but the elements for merged dimensions should list the same dimension name.

Example
~~~~~~~
In this example, we have climate model output of sea-surface temperatures over time. The SSTs are provided on a tripolar spatial grid over X years at monthly resoluation. The dataset is saved in a NetCDF file ``sst.nc`` within the ``SST`` variable. The NetCDF also contains spatial and temporal metadata for the grid.

By examining the NetCDF file::

    file = "sst.nc";
    variable = "SST";
    ncdisp(file, variable)

we can see that the dataset has dimensions (size) of Longitude (X) x Latitude (Y) x Time(Z). However, if we load and examine the spatial metadata::

    lat = ncread(file, 'latitude');
    size(lat)

we can see that the spatial metadata is a matrix, and values are not fixed along each dimension::

    % Fixed latitude index, changing longitude
    A = lat(1, 1);
    B = lat(2, 1);

    disp(A)
    disp(B)

so the spatial grid represents a collection of unique points, rather than a rectilinear grid. Thus, we should merge the longitude and latitude dimensions of the data file into a single ``site`` dimension for the ``.grid`` catalogue. We'll start by using the latitude and longitude metadata to define metadata for a ``.grid`` file with a ``site`` dimension::

    % Get the spatial metadata
    lat = ncread(file, 'latitude');
    lon = ncread(file, 'longitude');

    % Reshape metadata as a collection of unique points
    site = [lat(:), lon(:)];

    % Build metadata object
    time = ncread(file, 'time');
    metadata = gridMetadata('site', site, 'time', time);

    % Create gridfile
    grid = gridfile.new('sst.grid', metadata);


Next, we'll merge the latitude and longitude dimensions when we add data source files::

    % Whereas we might initially write
    % dimensions = ["lon", "lat", "time"];

    % We'll change this to
    dimensions = ["site", "site", "time"];

    % Then add the data source file to the catalogue
    file = "sst.nc";
    variable = "SST";
    metadata = grid.metadata;
    grid.add("netcdf", file, variable, dimensions, metadata);



Step 3: Data Adjustments
------------------------
Once again, we'll apply any data adjustments to our dataset. As a reminder, the syntaxes for data adjustments are::

    obj.fillValue(value)

    obj.validRange(range)

    obj.transform(type, parameters)


*Demo*
++++++
In the demo, our climate model temperature output is provided in units of Kelvin. However, we'd prefer to use units of Celsius, so we'll apply a data transformation to convert Kelvin to Celsius::

    % Add the data conversion
    proxies = gridfile("ntrend.grid");
    proxies.transform("plus", -273.15);

    % Note the conversion in the metadata attributes
    proxies.addAttributes("converted_units", "Celsius");
