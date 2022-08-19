Open Coding Session 1
=====================

Goals
-----

1. Ensure DASH is installed correctly
2. Practice using dot-indexing
3. Practice finding DASH documentation



Step 1: Check installation
--------------------------
Use the ``dash.version`` command to print the current version of DASH in the console::

    >> dash.version


.. note::

    If this causes an error message, you may not have the toolbox installed correctly. Try `reinstalling the toolbox <prerequisites.html#dash-toolbox>`_ or ask an organizer for help.



Step 2: Print help text
-----------------------
Use the `help` command to read the help text for `dash.version`::

    >> help dash.version


.. note::

    Optionally click the `Documentation Page` link at the bottom of the help text to open the documentation as a webpage.


Step 3: Open help page
----------------------
Use the `dash.doc` command to open the documentation as a webpage::

    >> dash.doc('dash.version')


Step 4: Compare
---------------
Compare the help text for `dash.doc`::

    >> help dash.doc

with the documentation page for `dash.doc`::

    >> dash.doc('dash.doc')

Notice the `Examples` section on the documentation page, which is not included in the help text.


.. note::

    DASH documentation pages will typically include usage examples, but these examples are not available when displaying help text in the console.
