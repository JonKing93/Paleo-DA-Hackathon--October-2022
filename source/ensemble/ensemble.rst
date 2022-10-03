ensemble
========

Ensemble Files
--------------
At the end of the last coding session, we discussed how the ``stateVector.build`` command can save a state vector ensemble to file, rather than returning the ensemble directly as an array. In general, we recommend saving ensembles to file because it affords several advantages:

First, ensemble files allow DASH to conserve computer memory when conducting data assimilation. Most commands **do not** require using all the data within an ensemble. Instead, they typically require a small subset of ensemble data - ranging from a few variables (as reconstruction targets), to a few rows (used to run a forward model). Using ensemble files allows the ``DASH`` toolbox to optimize its use of computer memory and only load data that is strictly necessary for an operation. This can significantly increase the speed of assimilation algorithms later on.

Other advantages of ensemble files pertain to using an ensemble over multiple coding session. Some ensembles can take a while to build (particularly ensembles with large state vectors). Saving to file allows you to reuse the same ensemble without waiting for it to rebuild. Furthermore, if you select ensemble members randomly, you may select different ensemble members when you rebuild the ensemble. Saving to file ensures that you use the same ensemble members over multiple coding sessions.


``ensemble`` class
------------------
The ``ensemble`` class allows you to manipulate and interact with state vector ensembles saved in these ensemble files. The class implements ensemble objects - each object is associated with a particular ensemble file, and allows you to manipulate and load the data in that file. The class also helps several common routines for data assimilation, such as designing evolving (time-dependent) ensembles. We'll use the remainder of this page to examine some key features of the ``ensemble`` class.


Features
--------

Placeholder for large ensembles
+++++++++++++++++++++++++++++++


Load Saved Ensemble
+++++++++++++++++++
The ``ensemble`` class implements a ``load`` command, which returns the ensemble saved in a file. You can then manipulate the loaded data array in the Matlab workspace. If you use an ensemble object to manipulate a saved ensemble, the ``load`` command will return the updated ensemble.


Select Variables or Members
+++++++++++++++++++++++++++



Evolving Ensembles
++++++++++++++++++
In some cases, you may want to design an evolving ensemble for



A common manipulation in ``DASH`` is to load a few specific variables from an ensemble. For example, you may want to load the reconstruction target variables as inputs for






Saving to file might initially seem to limit your ability to manipulate and interact with state vector ensembles. However, the ``ensemble`` class provides a solu



, thereby increasing the speed of assimilation algorithms.

By saving to file, you seemingly lose the ability to manipulate and interact with a state vector ensemble. However, the ``ensemble`` class provides a solution to this problem.

In many ways, the ``ensemble`` class is actually more useful than directly

Furthermore, the ``ensemble`` class includes routines that help implement evolving ensembles, and that






The ``DASH`` includes a number of optimizations that conserve


The ``ensemble`` class allows you to interact with a state vector ensemble saved in a ``.ens`` file. You can use the class to manipulate this saved data, without actually loading the ensemble into memory. The class uses ``ensemble`` objects to implement this functionality. Each object is associated with a particular ``.ens
