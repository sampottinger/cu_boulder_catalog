/**
 * Constants and "semi-constants" for the CU Boulder catalog visualization.
 *
 * @license MIT, A Samuel Pottinger
 */

final color WHITE = #FEFEFE;
final color TITLE_BG_COLOR = #E0E0E0;
final color BLACK = #333333;

final int AREA_HEIGHT = 10;
final int AREA_HEIGHT_COLLAPSE = 10;

final int START_YEAR = 1980;
final int END_YEAR = 2020;
final int YEAR_INCREMENT = 5;

List<String> SCHOOLS;
Map<String, Integer> SCHOOL_STARTS;
Map<String, Integer> SCHOOL_COLORS;
Map<String, Integer> SCHOOL_LINE_COLORS;

PFont HEADER_FONT;
PFont TITLE_FONT;
PFont SMALL_FONT;

Set<Key> LABEL_OVERRIDES;


/**
 * Load values not intended to change but that can only be loaded after the sketch has started.
 */
void loadSemiconstants() {
  SCHOOLS = new ArrayList<>();
  SCHOOLS.add("Architecture");
  SCHOOLS.add("Other");
  SCHOOLS.add("A&S");
  SCHOOLS.add("Engineering");
  SCHOOLS.add("Info");
  SCHOOLS.add("Journalism");
  SCHOOLS.add("Education");
  SCHOOLS.add("Business");
  SCHOOLS.add("Music");

  SCHOOL_STARTS = new HashMap<>();
  int runningTotal = 0;
  SCHOOL_STARTS.put("Architecture", runningTotal);
  runningTotal += 20 + 50;
  SCHOOL_STARTS.put("Other", runningTotal);
  runningTotal += 70 + 50;
  SCHOOL_STARTS.put("A&S", runningTotal);
  runningTotal += 700 + 50;
  SCHOOL_STARTS.put("Engineering", runningTotal);
  runningTotal += 140 + 50;
  SCHOOL_STARTS.put("Info", runningTotal);
  runningTotal += 80 + 50;
  SCHOOL_STARTS.put("Journalism", runningTotal);
  runningTotal += 50 + 50;
  SCHOOL_STARTS.put("Education", runningTotal);
  runningTotal += 130 + 50;
  SCHOOL_STARTS.put("Business", runningTotal);
  runningTotal += 240 + 50;
  SCHOOL_STARTS.put("Music", runningTotal);

  SCHOOL_COLORS = new HashMap<>();
  SCHOOL_LINE_COLORS = new HashMap<>();
  SCHOOL_COLORS.put("Architecture", #a6cee3);
  SCHOOL_LINE_COLORS.put("Architecture", #25a6cee3);
  SCHOOL_COLORS.put("Other", #b2df8a);
  SCHOOL_LINE_COLORS.put("Other", #25b2df8a);
  SCHOOL_COLORS.put("A&S", #33a02c);
  SCHOOL_LINE_COLORS.put("A&S", #2533a02c);
  SCHOOL_COLORS.put("Engineering", #e31a1c);
  SCHOOL_LINE_COLORS.put("Engineering", #25e31a1c);
  SCHOOL_COLORS.put("Info", #fb9a99);
  SCHOOL_LINE_COLORS.put("Info", #25fb9a99);
  SCHOOL_COLORS.put("Journalism", #1f78b4);
  SCHOOL_LINE_COLORS.put("Journalism", #251f78b4);
  SCHOOL_COLORS.put("Education", #C0C0C0);
  SCHOOL_LINE_COLORS.put("Education", #25C0C0C0);
  SCHOOL_COLORS.put("Business", #707070);
  SCHOOL_LINE_COLORS.put("Business", #25707070);
  SCHOOL_COLORS.put("Music", #ff7f00);
  SCHOOL_LINE_COLORS.put("Music", #25ff7f00);

  LABEL_OVERRIDES = new HashSet<>();
  LABEL_OVERRIDES.add(new Key("Engineering", "Civil Engineering", 1990));
  LABEL_OVERRIDES.add(new Key("Engineering", "Architectural Eng", 1990));
  LABEL_OVERRIDES.add(new Key("Engineering", "Environmental Eng", 1990));
  LABEL_OVERRIDES.add(new Key("Engineering", "Civil Engineering", 2000));
  LABEL_OVERRIDES.add(new Key("Engineering", "Environmental Eng", 2000));
  LABEL_OVERRIDES.add(new Key("A&S", "Ethnic Studies", 2000));
  LABEL_OVERRIDES.add(new Key("A&S", "Psychology", 2015));
  LABEL_OVERRIDES.add(new Key("A&S", "Neuroscience", 2015));

  SMALL_FONT = createFont("IBMPlexMono-Medium", 10);
  TITLE_FONT = createFont("IBMPlexMono-Medium", 15);
  HEADER_FONT = createFont("IBMPlexMono-Medium", 40);
}
