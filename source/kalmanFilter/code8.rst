Open Coding 8
=============

Goal
----
In this session, we will use the ``kalmanFilter`` class to run an assimilation.

Step 1: Create ``kalmanFilter`` object
--------------------------------------
We'll start by using the ``kalmanFilter`` command to create an object. The syntax is::

    obj = kalmanFilter

where **obj** is the new ``kalmanFilter`` object. You can optionally use the second input to label the object::

    obj = kalmanFilter(label)

where **label** is a string.

.. tip::

    You can also use the ``kalmanFilter.label`` command to label the object at any later point.

*Demo*
++++++
Here, we'll create a ``kalmanFilter`` object for the NTREND temperature assimilation. We'll apply a label to the object::

    label = "NTREND Temperature Demo";
    kf = kalmanFilter(label);

Inspecting the object:

.. code::
    :class: input

    disp(kf)

.. code::
    :class: output

    kalmanFilter with properties:

                Label: NTREND Temperature Demo

         Observations: none
                Prior: none
            Estimates: none
        Uncertainties: none

            Returning:
                Mean

we can see the initialized Kalman filter. We can see that none of the 4 essential inputs (observations, prior, estimates, and uncertainties) have been set yet. We can also see that the object will only update the ensemble mean when running the Kalman filter algorithm.


Step 2: Essential Inputs
------------------------
