Workshop Outline
=================
From the primer, we can see a few common tasks for implementing DA. These include:

1. Building a state vector ensemble,
2. Running forward models on the ensemble
3. Estimating proxy uncertainties, and
4. Running assimilation algorithms

In this workshop, we will use the DASH toolbox to implement points 1, 2, and 4. (We won't focus on proxy uncertainties today because of time constraints). We'll practice using DASH using some demo datasets, which we'll provide a bit later. The demo datasets are from real, published assimilations, and should give sense of typical DASH workflows. The remainder of the workshop is organized as follows:

DASH Introduction
    We'll start by introducing the DASH toolbox. We'll briefly examine its command style, layout, and how to access the documentation.

Demo Datasets
    Next, we'll introduce and download the demo datasets. We'll also use a few DASH utilities to examine metadata for these datasets.

Build a State Vector
    At this point, we'll start using DASH to implement an assimilation. We'll start by using DASH's ``stateVector`` class to design and build a state vector ensemble.

Forward models
    Next, we'll use the ``PSM`` interface to run forward models on climate variables in the ensemble.

Kalman Filter
    Finally, we'll use the ``kalmanFilter`` class to run an offline Kalman filter algorithm and produce a reconstruction.
