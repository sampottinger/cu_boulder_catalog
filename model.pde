class Key implements Comparable<Key> {

  private final String school;
  private final String name;
  private final int year;
  
  public Key(String newSchool, String newName, int newYear) {
    school = newSchool;
    name = newName;
    year = newYear;
  }
  
  public String getSchool() {
    return school;
  }
  
  public String getName() {
    return name;
  }
  
  public int getYear() {
    return year;
  }
  
  public String toString() {
    return school + "\t" + name + "\t" + year;
  }
  
  public int hashCode() {
    return toString().hashCode();
  }
  
  public boolean equals(Object other) {
    if (!(other instanceof Key)) {
      return false;
    }
    
    return toString().equals(other.toString());
  }
  
  public int compareTo(Key other) {
    return toString().compareTo(other.toString());
  }
  
}


class Area implements Comparable<Area> {
  
  private final Key key;
  private final boolean hasPrior;
  private final boolean hasSpring;
  private final boolean hasFall;
  private final List<Key> nextKeys;
  
  public Area(boolean newHasPrior, Key newKey, boolean newHasSpring, boolean newHasFall, List<Key> newNextKeys) {
    key = newKey;
    hasPrior = newHasPrior;
    hasSpring = newHasSpring;
    hasFall = newHasFall;
    nextKeys = newNextKeys;
  }
  
  public Key getKey() {
    return key;
  }
  
  public String getSchool() {
    return key.getSchool();
  }
  
  public String getName() {
    return key.getName();
  }
  
  public int getYear() {
    return key.getYear();
  }
  
  public boolean hasSpring() {
    return hasSpring;
  }
  
  public boolean hasFall() {
    return hasFall;
  }
  
  public boolean hasBothSemesters() {
    return hasSpring && hasFall;
  }
  
  public boolean hasPrior() {
    return hasPrior;
  }
  
  public boolean isInner() {
    return hasPrior && nextKeys.size() == 1;
  }
  
  public boolean isTerminal() {
    return nextKeys.size() == 0;
  }
  
  public List<Key> getNextKeys() {
    return nextKeys;
  }
  
  public int hashCode() {
    return key.hashCode();
  }
  
  public boolean equals(Object other) {
    if (!(other instanceof Area)) {
      return false;
    }
    
    return key.equals(((Area)other).getKey());
  }
  
  public int compareTo(Area other) {
    return key.compareTo(other.getKey());
  }
  
}


class Dataset {
  
  private final Map<Key, Area> areasByKey;
  private final Map<Integer, Map<String, List<Area>>> areasByYearSchool;
  
  public Dataset(List<Area> areas) {
    areasByKey = new HashMap<>();
    areasByYearSchool = new HashMap<>();
    
    Set<Area> uniqueAreas = new HashSet<>();
    
    for (Area area : areas) {
      if (uniqueAreas.contains(area)) {
        throw new RuntimeException("Area duplicate: " + area.getKey());
      } else {
        uniqueAreas.add(area);
      }
      
      areasByKey.put(area.getKey(), area);
      
      int year = area.getYear();
      if(!areasByYearSchool.containsKey(year)) {
        areasByYearSchool.put(year, new HashMap<>());
      }
      
      String school = area.getSchool();
      Map<String, List<Area>> areasBySchool = areasByYearSchool.get(year);
      if (!areasBySchool.containsKey(school)) {
        areasBySchool.put(school, new ArrayList<>());
      }
      
      List<Area> targetList = areasBySchool.get(school);
      targetList.add(area);
    }
  }
  
  public Area getByKey(Key key) {
    return areasByKey.get(key);
  }
  
  public List<Area> getForYearSchool(int year, String school) {
    Map<String, List<Area>> areasBySchool = areasByYearSchool.get(year);
    if (areasBySchool.containsKey(school)) {
      return areasBySchool.get(school);
    } else {
      return new ArrayList<>();
    }
  }
  
}


Dataset loadDataset() {
  Table targetTable = loadTable("catalog.csv", "header");
  
  List<Area> areas = new ArrayList<>();
  Set<Key> priorKeys = new HashSet<>();
  
  for (TableRow row : targetTable.rows()) {
    String semesters = row.getString("Semester");
    int year = row.getInt("Year");
    String school = row.getString("School");
    String name = row.getString("Area");
    String nextSchool = row.getString("Next School");
    String nextArea = row.getString("Next Area");
    
    Key key = new Key(school, name, year);
    boolean hasPrior = priorKeys.contains(key);
    boolean hasSpring = semesters.contains("Spring");
    boolean hasFall = semesters.contains("Fall");
    
    List<Key> nextKeys = new ArrayList<>();
    String[] nextNames = nextArea.split(";");
    boolean hasNext = !nextNames[0].equals("");
    if (hasNext) {
      for (String nextName : nextNames) {
        Key newKey = new Key(nextSchool, nextName, year + 5);
        nextKeys.add(newKey);
        
        // Connect but treat as new if in new school
        if (nextSchool.equals(school)) {
          priorKeys.add(newKey);
        }
      }
    }
    areas.add(new Area(hasPrior, key, hasSpring, hasFall, nextKeys));
  }
  
  return new Dataset(areas);
}
