stateVector
===========

This page should introduce concepts needed to build state vectors. It should include

1. State vectors
2. ensembles
3. State vs Ensemble dimensions
4. Sequences
5. Reference indices
6. Sequence indices
7. Mean Indices

----

The ``stateVector`` class is used to design and build state vector ensembles. The class implements ``stateVector`` objects, which act as design templates for state vector ensembles. Users can edit a template to describe an ensemble that matches their requirements. When finished, they can then use the template to automatically build a state vector ensemble that conforms to its design.

The ``stateVector`` class relies on ``.grid`` catalogues to describe climate data in a systematic manner. This allows users to use ``gridfile`` metadata values to design their state vector ensembles. In a typical workflow, users will these metadata values to select the gridfile data that should be used in a state vector.


New Concepts
------------
....write an intro to the next few sections....


State Vectors
-------------
