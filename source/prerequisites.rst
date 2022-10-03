Prerequisites
=============
Please complete the following tasks before the workshop begins:

1. `Install Matlab 2020b+ <#matlab-2020b>`_
2. `Install the DASH toolbox <#dash-toolbox>`_
3. `Download input datasets <#paleoclimate-data>`_


Matlab 2020b+
-------------

Please download and install Matlab 2020b or higher. You can find the latest Matlab release `here <https://www.mathworks.com/downloads/>`_.


.. _install-DASH:

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

*Paleoclimate proxy records*
++++++++++++++++++++++++++++
Any proxy records or chronologies you want to assimilate. To keep things simple, **we recommend using 1-3 proxy types and 10-20 records**.


*Reconstruction targets*
++++++++++++++++++++++++
Climate model output for the target reconstruction variables. These can be a climate metric/index, or a spatiotemporal climate field. For example, if you want to reconstruct the global surface temperature field, please bring modeled global surface temperature fields. Similarly, if you would like to reconstruct the Nino 3.4 index, please bring modeled Nino 3.4 indices. For the workshop, **we recommend a maximum of 3 target fields**.

.. important::
    To facilitate the creation of ensembles, please make sure that you have output from:

    A. Multiple time steps, or
    B. Multiple model runs, or
    C. Both.

    If using multiple reconstruction targets, the variables should be from the same time steps and/or model runs.


*Forward model inputs*
++++++++++++++++++++++
Climate model output for the climate variables required to run the proxy forward models. For example, if your forward model requires SSTs as an input, please bring modeled SST output.

.. important::

    You must provide forward model inputs for the same time steps and/or model runs as the reconstruction targets.

.. note::

    Although you will likely only need data from a few spatial points near the proxy records, it is often easiest to just download the full spatial field for each variable.
