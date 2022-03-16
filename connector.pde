void drawYearsConnectors(Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();
  
  translate(0, 100);
  
  for (int year = 1980; year < 2020; year += 5) {
    drawYearConnectors(year, vertPositions);
  }
  
  popStyle();
  popMatrix();
}


void drawYearConnectors(int year, Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();
  
  int column = year - START_YEAR;
  int midX = 100 + 50 * column + 100;
  
  translate(midX, 0);
  
  for (String school : SCHOOLS) {
    drawYearSchoolConnectors(year, school, vertPositions);
  }
  
  popStyle();
  popMatrix();
}


void drawYearSchoolConnectors(int year, String school, Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();
  
  // Prep
  noFill();
  List<Area> areas = dataset.getForYearSchool(year, school);
  
  // Draw
  for (Area area : areas) {
    color schoolColor = SCHOOL_LINE_COLORS.get(area.getSchool());
    stroke(schoolColor);
    strokeWeight(3);
    
    int yStart = vertPositions.get(area) + SCHOOL_STARTS.get(school) + 30;
    
    for (Key nextKey : area.getNextKeys()) {
      Area nextArea = dataset.getByKey(nextKey);
      if (nextArea == null) {
        throw new RuntimeException("Could not find " + nextKey); //<>//
      }
      
      if (!vertPositions.containsKey(nextArea)) {
        throw new RuntimeException("Could not connect to " + nextKey);
      }
      
      String endSchool = nextKey.getSchool();
      int yEnd = vertPositions.get(nextArea) + SCHOOL_STARTS.get(endSchool) + 30;
      bezier(0, yStart, 50, yStart, 250-50, yEnd, 250, yEnd);
    }
  }
  
  popStyle();
  popMatrix();
}
