PSM
===
The ``PSM`` package provides an interface that allows you to run forward models using values in a state vector ensemble. Running the forward models produces the proxy estimates required for assimilation algorithms. The interface includes wrappers to several officially supported proxy system forward models, but we anticipate that many users will want to run forward models outside of this official set. To that end, ``PSM`` includes a template for writing new forward model wrappers.

Ultimately though, the ``PSM`` interface is meant as a convenience. You are not required to use the interface to generate proxy estimates, and it's perfectly acceptable to run the forward models outside of ``DASH`` using your own code. (If doing so, you may find the ``ensembleMetadata`` helpful for locating forward model inputs - see ``dash.doc('ensembleMetadata')`` for details). Here we detail the main features of the interface.
