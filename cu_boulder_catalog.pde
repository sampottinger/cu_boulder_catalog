/**
 * Main entry point for the CU Boulder catalog visualization.
 *
 * @license MIT, A Samuel Pottinger
 */
import java.util.*;

import processing.pdf.*;

Dataset dataset;


/**
 * Load the data and "semi-constants" which are unchanging but require setup.
 */
void setup() {
  size(2400, 2150, PDF, "cu_boulder_catalog.pdf");

  dataset = loadDataset();
  loadSemiconstants();
}


/**
 * Draw the visualization and save to a PDF.
 */
void draw() {
  background(WHITE);

  Map<Area, Integer> positions = positionYears();

  drawTitle();
  drawYearsConnectors(positions);
  drawYearsBody(positions);

  exit();
}
