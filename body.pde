/**
 * Logic for drawing the main body of the CU Boulder visualization.
 *
 * @license MIT, A Samuel Pottinger
 */

/**
 * Draw the different years of the catalog available.
 *
 * @param vertPositions The vertical (y axis) coordinates of each area of study.
 */
void drawYearsBody(Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();

  translate(0, 100);

  for (int year = 1980; year <= 2020; year += 5) {
    drawYearBody(year, vertPositions);
  }

  popStyle();
  popMatrix();
}


/**
 * Draw a single year.
 *
 * @param year The year like 2020.
 * @param vertPositions Vertical positions of each area of study.
 */
void drawYearBody(int year, Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();

  int column = year - START_YEAR;
  int midX = 100 + 50 * column + 100;

  translate(midX, 0);

  for (String school : SCHOOLS) {
    drawYearSchoolBody(year, school, vertPositions);
  }

  popStyle();
  popMatrix();
}


/**
 * Draw a single school / college for a year.
 *
 * @param year The year to draw like 2020.
 * @param school The name of the school like Engineering.
 * @param vertPositions The y coordinates of each of the areas of study.
 */
void drawYearSchoolBody(int year, String school, Map<Area, Integer> vertPositions) {
  pushMatrix();
  pushStyle();

  // Prep
  translate(0, SCHOOL_STARTS.get(school) + 30);
  List<Area> areas = dataset.getForYearSchool(year, school);

  // Draw
  ellipseMode(RADIUS);
  textFont(SMALL_FONT);

  for (Area area : areas) {
    fill(WHITE);
    color schoolColor = SCHOOL_COLORS.get(area.getSchool());
    stroke(schoolColor);

    int y = vertPositions.get(area);

    if (area.isInner() && !LABEL_OVERRIDES.contains(area.getKey())) {
      strokeWeight(1);
      ellipse(0, y, 4, 4);
    } else {
      strokeWeight(1.5);
      ellipse(0, y, 4, 4);

      fill(schoolColor);

      if (area.hasPrior()) {
        textAlign(LEFT, BOTTOM);
        text(area.getName(), 6, y + 5.5);
      } else {
        textAlign(RIGHT, BOTTOM);
        text(area.getName(), -7, y + 5.5);
      }
    }

    fill(schoolColor);
    noStroke();
    if (area.hasBothSemesters()) {
      ellipse(0, y, 3, 3);
    } else if (area.hasSpring()) {
      arc(0, y, 3, 3, PI - HALF_PI, PI + HALF_PI);
    } else if (area.hasFall()) {
      arc(0, y, 3, 3, -HALF_PI, HALF_PI);
    } else {
      throw new RuntimeException(area.getKey() + " no semester.");
    }
  }

  popStyle();
  popMatrix();
}
