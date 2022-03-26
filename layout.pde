/**
 * Utility functions to help lay out area of study for the CU Boulder catalog visualization.
 *
 * @license MIT, A Samuel Pottinger
 */


/**
 * Layout a set of areas of study vertically (y axis pixel coordinates).
 *
 * @param areas The areas to lay out vertically.
 * @return The areas of study laid out vertically per year in alphabetic order in the form of a map
 *    from Area to y coordinate.
 */
Map<Area, Integer> layoutAreas(List<Area> areas) {
  Map<Area, Integer> retPositions = new HashMap<>();

  Collections.sort(areas, (a, b) -> a.compareTo(b));

  int curHeight = 0;
  for (Area area : areas) {
    int newHeight = area.isInner() ? AREA_HEIGHT_COLLAPSE : AREA_HEIGHT;
    assert !retPositions.containsKey(area);
    retPositions.put(area, curHeight + newHeight / 2);
    curHeight += newHeight;
  }

  return retPositions;
}


/**
 * Position a all years' areas of study vertically (y axis coordiantes).
 *
 * @return The areas of study laid out vertically per year in alphabetic order in the form of a map
 *    from Area to y coordinate.
 */
Map<Area, Integer> positionYears() {
  Map<Area, Integer> positions = new HashMap<>();

  for (int year = START_YEAR; year <= END_YEAR; year += YEAR_INCREMENT) {
    positions.putAll(positionYearBody(year));
  }

  return positions;
}


/**
 * Position a single year's areas of study vertically (y axis coordiantes).
 *
 * @param year The integer year to lay out like 2020.
 * @return The areas of study laid out vertically for a year in alphabetic order in the form of a
 *    map from Area to y coordinate.
 */
Map<Area, Integer> positionYearBody(int year) {
  Map<Area, Integer> positions = new HashMap<>();

  for (String school : SCHOOLS) {
    positions.putAll(positionYearSchoolBody(year, school));
  }

  return positions;
}


/**
 * Position a school / college's areas of study for a single year vertically (y axis coordiantes).
 *
 * Using data available in the sketch the global dataset, position a school / college's areas of
 * study for a single year vertically (y axis coordiantes).
 *
 * @param year The integer year to lay out like 2020.
 * @param school The name of the school to position as it appears in the dataset like Engineeering.
 * @return The areas of study laid out vertically for a year in alphabetic order in the form of a
 *    map from Area to y coordinate.
 */
Map<Area, Integer> positionYearSchoolBody(int year, String school) {
  List<Area> areas = dataset.getForYearSchool(year, school);
  return layoutAreas(areas);
}
