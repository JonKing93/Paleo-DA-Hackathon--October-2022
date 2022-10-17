Demo Descriptions
=================

Demo 1
------
The first demo dataset is designed for a Common Era assimilation. This demo uses a set of temperature-sensitive tree-ring records to reconstruct surface temperature in the Northern Hemisphere over the last millennium. The demo relies on (1) climate model output from the CESM Last Millennium Ensemble, and (2) the NTREND tree-ring network. To generate proxy estimates, we will use univariate linear forward models trained on the temperature at each site. You can :download:`download the files for this demo here <NTREND_demo.zip>`. We will refer to this demo as the **NTREND Demo** in the remainder of the workshop.

The downloaded demo includes the following data files:

``ntrend.mat``
    This MAT-file holds the data records and some metadata the NTREND tree-ring network. It also includes linear slopes for the forward models, and proxy uncertainties for the Kalman filter.

``b.e11.BLMTRC5CN.f19_g16.002.cam.h0.TREFHT.085001-184912.nc``
    The two NetCDF files hold surface temperatures (TREFHT) output from the CESM Last Millennium Ensemble. (Specifically, output from full-forcing run 2). This output is a spatial field with a 1.9 x 2.5 (latitude x longitude) resolution. The output is provided on a monthly time step. This first file holds output from 850-1849 CE.

``b.e11.BLMTRC5CN.f19_g16.002.cam.h0.TREFHT.185001-200512.nc``
    This second model output file holds output from 1850-2005 CE.

The demo also includes two other files: ``ntrend.grid`` and ``temperature-cesm.grid``. These are the data catalogue files that we will examine in the next open coding session. ``ntrend.grid`` catalogues the tree-ring dataset, and ``temperature-cesm.grid`` catalogues the climate model output.


Demo 2
------
The second demo is designed for a Last Glacial Maximum (LGM) assimilation. This demo uses a set of UK'37 records to reconstruct ??? at the LGM. The demo relies on (1) climate model output from ???, and (2) ??? proxy records. You can download the files for this demo <here INSERT LINK>. We will refer to this demo as the **LGM Demo** in the remainder of the workshop.

The downloaded demo includes the following raw data files:
