Open Coding 5
=============

Goal
----
Use the ``stateVector`` class to design and build a state vector ensemble.


Step 1: Create new state vector
-------------------------------
Use the ``stateVector`` command to create a new ``stateVector`` object.

    newObject = stateVector

where **newObject** is the new state vector object.

You can optionally label the object using the first input::

    newObject = stateVector(label)

where **label** is a string used as the label.

.. note::
    You can also label an existing ``stateVector`` object using the ``stateVector.label`` command.

In either case, the new ``stateVector`` object will be empty. It does not yet have any variables, and so the state vector will initially have a length of zero. In the next section, we'll start adding variables to the state vector.


*Demo*
++++++

We'll create a new ``stateVector`` object and label it as "NTREND Temperature Demo"

.. code::
    :class: input

    label = "NTREND Temperature Demo";
    sv = stateVector(label)

.. code::
    :class: output

    sv =

      stateVector with properties:

            Label: NTREND Temperature Demo
           Length: 0 rows
        Variables: 0

We can see from the console output that the state vector currently has 0 variables, and thus has a length of 0 rows.



Step 2: Add variables
---------------------
At this point, our ``stateVector`` object does not have any variables. In the context of DASH, a **"state vector variable"** refers to some subset of data extracted from a gridfile. Note that a state vector may include multiple variables derived from the same gridfile. Each variable is then defined by its own unique combination of indices, sequences, and means. For example, a state vector might include a spatial field, and a spatial mean derived from the same climate variable. Since the spatial field does not implement a mean, it represents a different state vector variable than the spatial mean.

Note that the definition of a state vector variable says nothing about individual climate variables - a given state vector variable may include multiple climate variables, so long as those climate variables are derived from the same gridfile. For example, a state vector variable can include multiple climate variables along the ``var`` dimension of a gridfile, although this is not required. This definition is deliberately open-ended, and it allows for flexible design of different state vectors.

In general, state vectors should include two types of variables:

1. Reconstruction targets, and
2. Climate variables required to run proxy forward models

To add a variable to a ``stateVector`` object, use the ``stateVector.add`` command. The base syntax for this command is::

    obj = obj.add(variableName, grid)

Here, **variableName** is a string listing the name of the new variable. The name must be a valid Matlab variable name.

The **grid** input indicates the gridfile that is associated with the new variable. It may either be a ``gridfile`` object, or the name of a saved ``.grid`` file. If using a file name, the name may either be an absolute file path, or the name of a file on the active path.

The **obj** output is the updated ``stateVector`` object.


*Multiple variables*
++++++++++++++++++++
The ``stateVector.add`` command can also be used to add multiple variables to a state vector at once. In this case, the syntax becomes::

    obj = obj.add(variableNames, grids)

where **variableNames** is a vector of names, and **grids** is a vector with one ``gridfile`` or file name per new variable. If all of the new variables are derived from the same gridfile, then **grids** may instead be a single ``gridfile`` object or file name referencing the appropriate catalogue.


*Demo*
++++++













Note that the definition of a state vector variable says nothing about specific climate variables - a given state vector variable may include multiple climate variables, so long as those climate variables are derived from the same gridfile. This definition is deliberately open-ended, and it allows for flexible design of different state vectors.

.. note::
     The ``var`` dimension in gridfile metadata also does not define a state v




Each A given variable may include one or more climate variables, so long as those variables are derived from the same gridfile. Likewise, a state vector may include multiple variables derived from the same gridfile. For example, a state vector that includes a spatial temperature field, as well as global-mean temperatures. This definition of a "variable" is deliberately open ended, and allows for flexible design of different state vectors.

Next, we'll use the ``stateVector.add`` command to add variables to our state vector. The base syntax for this command is:

    obj = obj.add()
