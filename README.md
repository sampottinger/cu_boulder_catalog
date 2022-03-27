CU Boulder Catalog
================================================================================
Visualization that shows how areas of study have evolved at the [University of Colorado at Boulder](https://www.colorado.edu/).

<br>

Purpose and method
--------------------------------------------------------------------------------
What we think of as different academic areas of studies and disciplines changes over time. This visualization shows how these different areas merge, break apart, and move around over time by using the [CU Boulder archive of course schedules](https://www.colorado.edu/registrar/about/archive).

<br>

Method
--------------------------------------------------------------------------------
Names of non-empty sections were transcribed into the records inside the `data` folder with a best attempt to understand how sections from one year map to the next. For example, Computer Science is a section in the College of Arts and Sciences in 1980 and then moves in 1985. Each year from 1980 to 2020 are recorded at 5 year increments.

<br>

Usage
--------------------------------------------------------------------------------
Available online at [https://gleap.org/static/special/cu_boulder_catalog.pdf](https://gleap.org/static/special/cu_boulder_catalog.pdf).

<br>

Local Development Environment
--------------------------------------------------------------------------------
Simply open `cu_boulder_catalog.pde` in [Processing 4](https://processing.org/).

<br>

Deployment
--------------------------------------------------------------------------------
The visualization is written to a static local PDF file. That can be deployed anywhere with static file serving.

<br>

Development Standards
--------------------------------------------------------------------------------
Please try to provide JavaDoc where possible.

<br>

Open Source
--------------------------------------------------------------------------------
Code available under the MIT license. Uses the following:

 - [Processing](https://processing.org/) under the [LGPL license](https://github.com/processing/processing/blob/master/license.txt).
 - [Processing PDF](https://processing.org/reference/libraries/pdf/index.html) under the [LGPL license](https://github.com/processing/processing/blob/master/java/libraries/pdf/src/processing/pdf/PGraphicsPDF.java).

This CU Boulder Catalog database (`data/catalog.csv`) is made available under the Open Database License: http://opendatacommons.org/licenses/odbl/1.0/. Any rights in individual contents of the database are licensed under the Database Contents License: http://opendatacommons.org/licenses/dbcl/1.0/.
