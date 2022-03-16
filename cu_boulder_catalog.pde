import java.util.*;

import processing.pdf.*;

Dataset dataset;


void setup() {
  size(2400, 2150, PDF, "cu_boulder_catalog.pdf");
  
  dataset = loadDataset();
  loadSemiconstants();
}


void draw() {
  background(WHITE);
  
  Map<Area, Integer> positions = positionYears();
  
  drawTitle();
  drawYearsConnectors(positions);
  drawYearsBody(positions);
  
  exit();
}
