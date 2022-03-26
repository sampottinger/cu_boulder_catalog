/**
 * Logic to draw titles, scales, and other non-data "visualization" chrome.
 *
 * @license MIT, A Samuel Pottinger
 */

/**
 * Draw the title at the top of the visualization.
 */
void drawTitle() {
  pushMatrix();
  pushStyle();

  noStroke();
  fill(TITLE_BG_COLOR);
  rect(0, 0, width, 60);

  noFill();
  stroke(BLACK);
  strokeWeight(1.5);
  line(0, 60, width, 60);

  textFont(HEADER_FONT);
  noStroke();
  fill(BLACK);
  textAlign(LEFT, BOTTOM);
  text("History of CU Boulder Course Schedules", 10, 60);

  textFont(TITLE_FONT);
  textAlign(RIGHT, BOTTOM);
  text("Named sections in course schedules from 1980 to 2022 for 8 schools (and select \"other\")", width - 5, 20);
  text("Available only fall", width - 20, 38);
  text("Available only spring", width - 240, 38);
  text("Available both fall and spring semester", width - 20, 56);

  noFill();
  stroke(BLACK);
  strokeWeight(2);
  ellipseMode(RADIUS);
  ellipse(width - 10, 27, 5, 5);
  ellipse(width - 230, 27, 5, 5);
  ellipse(width - 10, 45, 5, 5);

  noStroke();
  fill(BLACK);
  arc(width - 10, 27, 3, 3, PI - HALF_PI, PI + HALF_PI);
  arc(width - 230, 27, 3, 3, -HALF_PI, HALF_PI);
  ellipse(width - 10, 45, 3, 3);

  for (int year = 1980; year <= 2020; year +=5) {
    drawYearLabel(year);
  }

  drawSchoolLabel("Architecture", "Program in Environmental Design");
  drawSchoolLabel("Other", "Other Selected");
  drawSchoolLabel("A&S", "College of Arts and Sciences");
  drawSchoolLabel("Engineering", "College of Engineering & Applied Science");
  drawSchoolLabel("Info", "College of Media, Communication and Information");
  drawSchoolLabel("Journalism", "School of Journalism and Mass Communication");
  drawSchoolLabel("Education", "School of Education");
  drawSchoolLabel("Business", "Leeds School of Business");
  drawSchoolLabel("Music", "College of Music");

  popStyle();
  popMatrix();
}


/**
 * Draw the horizontal axis label for a year.
 *
 * @param year The year to label on the horizontal axis.
 */
void drawYearLabel(int year) {
  pushMatrix();
  pushStyle();

  int column = year - START_YEAR;
  int midX = 100 + 50 * column + 100;

  textFont(TITLE_FONT);
  textAlign(CENTER, BOTTOM);
  noStroke();
  fill(BLACK);

  text(year, midX, 85);

  popStyle();
  popMatrix();
}


/**
 * Draw a label for a school or college.
 *
 * @param school The name of the school as it appears in the source data like Engineering.
 * @param label The label to display to the user like College of Engineering and Applied Sciences.
 */
void drawSchoolLabel(String school, String label) {
  pushMatrix();
  pushStyle();

  int y = SCHOOL_STARTS.get(school) + 100;
  int schoolColor = SCHOOL_COLORS.get(school);

  fill(schoolColor);
  noStroke();
  textAlign(LEFT, TOP);
  textFont(TITLE_FONT);
  text(label, 10, y);

  noFill();
  stroke(schoolColor);
  strokeWeight(1);
  for (int x = 10; x < width - 10; x += 4) {
    point(x, y);
  }

  popStyle();
  popMatrix();
}
