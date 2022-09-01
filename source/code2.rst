Open Coding 2
=============

In this session, we will practice using the ``gridMetadata`` class to create metadata objects for climate datasets. Steps 1 and 2 provide some practice problems for using ``gridMetadata``, and solutions are provided at the bottom of the page. If you already feel confident using the class, feel free to skip directly to step 3.


Goals
-----
By the end of the session, participants should be able to create metadata objects for their own datasets.



Step 1: Practice Creating Metadata
----------------------------------
Use the ``gridMetadata`` command to create metadata for the following datasets. Solutions are provided at the bottom of the page.


*Practice A*
++++++++++++
The dataset has 3 dimensions: latitude, longitude, and time. Latitude extends from the equator to the North pole in steps of 1 degree. Longitude metadata proceeds from 0 to 355 in steps of 5 degrees. The dataset extends over the Common Era from 1-2000 CE with an annual time step.

*Practice B*
++++++++++++
Same as practice A, but with a monthly time step.

*Practice C*
++++++++++++
The dataset consists of measurements from a series of proxy sites over time. The spatial coordinates and altitude of each proxy site are given below. The proxy dataset extends from the Last Glacial Maximum (at 24 ka) to present (0 ka) in steps of 3 kyr.

::

    coordinates = [1 2
                   3 4
                   5 6]
    altitude = [100; 200; 300]

*Practice D*
++++++++++++
Same as practice C, but the metadata should also include each proxy site's ID.

::

    siteID = ["13AB1"; "14CD2"; "8Xa"]

.. hint::

    You can use Matlab's ``string`` command to convert numeric matrices to string matrices



Step 2: Practice Metadata Attributes
------------------------------------
Add attributes to a metadata object. Do this by either including attributes in the ``gridMetadata`` command, or by using the ``addAttributes`` command to add attributes to an exisiting metadata object.

*Practice E*
++++++++++++
For the dataset from practice problem A, indicate that the units of the dataset are in Kelvin. Also include the following cell area weights as a metadata attribute::

    weights = repmat(cosd(0:90), 72, 1)



Step 3: Create Metadata for Real Datasets
-----------------------------------------
Create a gridMetadata object for a dataset you brought to the workshop. Create some dimensional metadata that you find useful - this could be metadata read from a NetCDF or MAT file, or some other value that you prefer. Use the ``gridMetadata`` command to create the metadata object. Optionally include some attributes to better document the dataset.



Step 4: Optional Reading
------------------------
If you finish early, check out the ``gridMetadata`` documentation page to see additional commands and options. For example, the ``edit`` command can be used to alter the metadata for a dimension. Separately, the ``index`` command can be used to return metadata at specific elements along a dimension. To open the documentation page, enter::

    dash.doc('gridMetadata')

in the console.



Solutions
---------

*Practice A*
++++++++++++

::

    lat = 0:90;
    lon = 0:5:355;
    time = 1:2000;
    meta = gridMetadata("lat", lat', "lon", lon', "time", time')

.. warning::

    Remember that ``gridMetadata`` interprets each **row** as a unique metadata value. Be sure that ``lat``, ``lon``, and ``time``, are provided as column vectors.


*Practice B*
++++++++++++

There are a number of ways to create monthly time metadata. Potential options include using decimal years::

    time = linspace(1, 2000, 2000*12)

or a date vector::

    years = repmat(1:2000, 12, 1);
    months = repmat((1:12)', 2000, 1);
    time = [years(:), months];

However, we recommend using Matlab's ``datetime`` format, which allow you to sort values by years, months, and days. (this functionality can be useful later when building state vector ensembles)::

    time = datetime(1,1,1) : calmonths(1) : datetime(2000,12,1)
    meta = gridMetadata("lat", lat', "lon", lon', "time", time')


*Practice C*
++++++++++++

::

    site = [coordinates, altitude];
    time = 24:-3:0;
    meta = gridMetadata("site", siteMetadata, "time", time')


*Practice D*
++++++++++++

::

    % Convert numeric metadata to string
    coordinates = string(coordinates);
    altitude = string(altitude);

    % Build the metadata object
    site = [coordinates, altitude, siteID];
    time = 24:-3:0;
    meta = gridMetadata("site", site, "time", time)


*Practice E*
++++++++++++

Using ``gridMetadata``::

    attributes = struct('Units', 'Kelvin', 'areaWeights', weights);
    meta = gridMetadata("lat", lat', "lon", lon', "time", time', "attributes", attributes)

Or using ``addAttributes``::

    meta = gridMetadata("lat", lat', "lon", lon', "time", time');
    meta = meta.addAttributes("Units", "Kelvin", "areaWeights", weights)
