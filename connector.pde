/**
 * Logic to draw connections from fields of study in one year to another.
 *
 * @license MIT, A Samuel Pottinger
 */

/**
 * Draw all connectors from one field of study in one year to another.
 *
 * @param vertPositions The vertical y axis position in pixels for each area of study.
 */
void drawYearsConnectors(Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();

  translate(0, 100);

  for (int year = START_YEAR; year < END_YEAR; year += 5) {
    drawYearConnectors(year, vertPositions);
  }

  popStyle();
  popMatrix();
}


/**
 * Draw connections from one year to the next.
 *
 * @param year The year from which connections should be drawn to the next year availble.
 * @param vertPositions The vertical y axis position in pixels for each area of study.
 */
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


/**
 * Draw the connections for areas of study in a single school / college for a single year.
 *
 * @param year The year from which connections should be drawn to the next year available.
 * @param vertPositions The vertical y axis position in pixels for each area of study.
 */
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
