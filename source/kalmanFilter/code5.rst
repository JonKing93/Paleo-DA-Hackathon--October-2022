Open Coding 5
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


*NTREND Demo*
+++++++++++++
Here, we'll create a ``kalmanFilter`` object for the NTREND demo. We'll also apply a label to the object::

    label = "NTREND Demo";
    kf = kalmanFilter(label);

Inspecting the object:

.. code::
    :class: input

    disp(kf)

.. code::
    :class: output

    kalmanFilter with properties:

                Label: NTREND Demo

         Observations: none
                Prior: none
            Estimates: none
        Uncertainties: none

            Returning:
                Mean

we can see the initialized Kalman filter. We can see that none of the 4 essential inputs (observations, prior, estimates, and uncertainties) have been set yet. We can also see that the object will only update and return the ensemble mean when running the Kalman filter algorithm.


*LGM Demo*
++++++++++
Here, we'll create a ``kalmanFilter`` object for the LGM temperature assimilation. We'll also apply a label to the object::

    label = "LGM Demo";
    kf = kalmanFilter(label);

Inspecting the object:

.. code::
    :class: input

    disp(kf)

.. code::
    :class: output

    kalmanFilter with properties:

                Label: LGM Demo

         Observations: none
                Prior: none
            Estimates: none
        Uncertainties: none

            Returning:
                Mean

we can see the initialized Kalman filter. We can see that none of the 4 essential inputs (observations, prior, estimates, and uncertainties) have been set yet. We can also see that the object will only update and return the ensemble mean when running the Kalman filter algorithm.



Step 2: Essential Inputs
------------------------

Next, we'll use the ``prior``, ``observations``, ``estimates``, and ``uncertainties`` commands to provide essential inputs to the Kalman filter. All four commands use a similar base syntax - each command takes a data array as input, and outputs an updated ``kalmanFilter`` object::

    obj = obj.prior(X)
    obj = obj.observations(Y)
    obj = obj.estimates(Ye)
    obj = obj.uncertainties(R)

**X**
    The prior may either be provided via an ``ensemble`` object or as a data matrix. If using a matrix, each row should be an element of the state vector, and each column should be an ensemble member.

**Y**
    The proxy observations should be a data matrix. Each row holds a particular proxy record and each column holds the values for an assimilation time step. You can a NaN value when a proxy record does not have values for a particular time step.

**Ye**
    The proxy estimates should be a matrix with one row per proxy record, and one column per ensemble member.

**R**
    The proxy uncertainties should be a data matrix holding either error-variances or a full error-covariance matrix. If using error variances, the uncertainties should be a column vector with one row per proxy record. If using error-covariances, the matrix should be symmetric with one row and one column per proxy record.

You can also modify these commands to use different values in different assimilation time steps. (For example, to use an evolving prior). We will not discuss this syntax in the workshop, but you can read about it in the DASH documentation.


``ensemble.useVariables``
+++++++++++++++++++++++++
When providing an assimilation prior, the prior only needs to contain state vector variables that represent reconstruction targets. Since we already generated proxy estimates, we don't need to assimilate variables used only as forward model inputs. You can use the ``ensemble.useVariables`` command to restrict an ensemble object to specific state vector variables. The syntax for the command is::

    obj = obj.useVariables(variables)

**variables**
    The input should list the names or indices of specific variables in the state vector ensemble.

**obj**
    The output is an updated ensemble object.


*NTREND Demo*
+++++++++++++

We'll use the four input commands to provide the essential data values for our assimilation. We'll start by providing the prior. Our prior will consist of the reconstruction targets **T** and **T_index**. We'll use the ``ensemble.useVariables`` command to limit the reconstruction to these two variables::

    % Get an ensemble object
    ens = ensemble('ntrend');

    % Restrict the object to reconstruction target variables
    variables = ["T", "T_index"];
    ens = ens.useVariables(variables);

    % Provide the ensemble to the Kalman filter
    kf = kf.prior(ens);

Next, we'll provide the proxy records. The proxy records are catalogued in ``ntrend.grid``, so we'll first use the ``gridfile.load`` command to load them as a data array::

    % Load the proxy estimates
    proxies = gridfile('ntrend');
    Y = proxies.load;

    % Provide the proxy records to the Kalman filter
    kf = kf.observations(Y);

Next, we'll provide the proxy estimates (Ye). We generated these proxy estimates in the previous open coding session::

    % Provide the proxy estimates
    kf = kf.estimates(Ye);

Finally, we'll provide proxy uncertainties - specifically, error variances. These values are provided in the ``ntrend.mat`` file, and were produced by (1) running the forward models on instrumental observations, and then (2) comparing the instrumental proxy estimates to the real instrumental proxy records::

    % Load the proxy uncertainties
    data = load('ntrend.mat', 'R');
    R = data.R;

    % Provide the uncertainties to the Kalman filter
    kf = kf.uncertainties(R);

Inspecting the updated ``kalmanFilter`` object:

.. code::
    :class: input

    disp(kf)

.. code::
    :class: output

    kalmanFilter with properties:

                      Label: NTREND Demo

               Observations: set
                      Prior: static
                  Estimates: set
              Uncertainties: variances

          Observation Sites: 54
        State Vector Length: 4321
           Ensemble Members: 1156
                     Priors: 1
                 Time Steps: 1262

                  Returning:
                      Mean

we can see that the Kalman filter now includes all four essential inputs. We can see it uses a static (time-independent) prior, and error-variances for the uncertainties. The output also shows a few key sizes, such as the number of observations sites, prior, assimilation time steps, etc.


*LGM Demo*
++++++++++

We'll use the four input commands to provide the essential data values for our assimilation. We'll start by providing the prior using an ensemble object::

    % Get the ensemble object
    ens = ensemble('lgm');

    % Provide the ensemble to the Kalman filter
    kf = kf.prior(ens);

Next, we'll provide the proxy records. The proxy records are catalogued in ``uk37.grid``, so we'll first use the ``gridfile.load`` command to load them as a data array::

    % Load the proxy records
    proxies = gridfile('uk37');
    Y = proxies.load;

    % Provide the proxy records to the Kalman filter
    kf = kf.observations(Y);

Next, we'll provide the proxy estimates (Ye) and uncertainties (R). We generated both of these in the previous coding session::

    % Provide proxy estimates and uncertainties
    kf = kf.estimates(Ye);
    kf = kf.uncertainties(R);

Inspecting the updated ``kalmanFilter`` object:

.. code::
    :class: input

    disp(kf)

.. code::
    :class: output

    kalmanFilter with properties:

                      Label: LGM Demo

               Observations: set
                      Prior: static
                  Estimates: set
              Uncertainties: variances

          Observation Sites: 139
        State Vector Length: 122880
           Ensemble Members: 16
                     Priors: 1
                 Time Steps: 1

                  Returning:
                      Mean

we can see that the Kalman filter now includes all four essential inputs. We can see it uses a static (time-independent) prior, and error-variances for the uncertainties. The output also shows a few key sizes, such as the number of observations sites, prior, assimilation time steps, etc.
