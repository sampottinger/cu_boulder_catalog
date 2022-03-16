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


Map<Area, Integer> positionYears() {
  Map<Area, Integer> positions = new HashMap<>();
  
  for (int year = 1980; year <= 2020; year += 5) {
    positions.putAll(positionYearBody(year));
  }
  
  return positions;
}


Map<Area, Integer> positionYearBody(int year) {
  Map<Area, Integer> positions = new HashMap<>();
  
  for (String school : SCHOOLS) {
    positions.putAll(positionYearSchoolBody(year, school));
  }
  
  return positions;
}


Map<Area, Integer> positionYearSchoolBody(int year, String school) {
  List<Area> areas = dataset.getForYearSchool(year, school);
  return layoutAreas(areas);
}
