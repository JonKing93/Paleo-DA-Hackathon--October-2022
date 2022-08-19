Prerequisites
=============
Please complete the following tasks before the workshop begins.


Matlab 2020b+
-------------

Please download and install Matlab 2020b or higher. You can find the latest Matlab release `here <https://www.mathworks.com/downloads/>`_.


DASH Toolbox
------------

Please install the latest version of the DASH toolbox in your Matlab environment.

1. Navigate to the `latest DASH release`_.
2. From the "Assets" section, download the ``DASH-<version>.mltbx`` file.
3. Open the downloaded file. This should automatically install the toolbox in your Matlab environment.
4. That's it, you're done! You can optionally verify your installation by entering::

    >> dash.version

   in the Matlab console. If the toolbox installed successfully, this will display the current DASH version.

.. _latest DASH release: https://github.com/JonKing93/DASH/releases/latest


Paleoclimate Data
-----------------

Please download any paleoclimate data you will need for assimilation and bring it to the workshop. In general, we recommend saving data in NetCDF, MAT-file, and/or delimited text file formats whenever possible.

Paleoclimate proxy records
++++++++++++++++++++++++++
Any proxy records or chronologies you want to assimilate. To keep things simple, we recommend using a single proxy type and 10-20 records.

Reconstruction targets
++++++++++++++++++++++
Climate model output for the target reconstruction variable. This can be a climate metric/index, or a spatiotemporal climate field. For example, if you want to reconstruct the global surface temperature field, please bring modeled global surface temperature fields. Alternatively, if you would like to reconstruct the Nino 3.4 index, please bring Nino 3.4 indices from one or more model runs.

Additionally, to facilitate the creation of ensembles, please make sure that you have output from:

A. Multiple time steps, or
B. Multiple model runs, or
C. Both.

Forward model inputs
++++++++++++++++++++
