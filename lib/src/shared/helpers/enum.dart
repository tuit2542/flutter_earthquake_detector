enum EarthquakeOrderBy {
  time("time"),
  timeAsc("time-asc"),
  magnitude("magnitude"),
  magnitudeAsc("magnitude-asc");

  final String value;
  const EarthquakeOrderBy(this.value);
}

enum AlertLevel {
  green("green"),
  yellow("yellow"),
  orange("orange"),
  red("red");

  final String value;
  const AlertLevel(this.value);
}

enum FormatType {
  csv("csv"),
  geojson("geojson"),
  kml("kml"),
  quakeml("quakeml"),
  text("text"),
  xml("xml");

  final String value;
  const FormatType(this.value);
}

enum EventType {
  accidentalExplosion("accidental explosion"),
  acousticNoise("acoustic noise"),
  acousticNoiseUnderscore("acoustic_noise"),
  anthropogenicEvent("anthropogenic_event"),
  buildingCollapse("building collapse"),
  chemicalExplosion("chemical explosion"),
  chemicalExplosionUnderscore("chemical_explosion"),
  collapse("collapse"),
  debrisAvalanche("debris avalanche"),
  earthquake("earthquake"),
  eq("eq"),
  experimentalExplosion("experimental explosion"),
  explosion("explosion"),
  iceQuake("ice quake"),
  inducedOrTriggeredEvent("induced or triggered event"),
  industrialExplosion("industrial explosion"),
  landslide("landslide"),
  meteor("meteor"),
  meteorite("meteorite"),
  mineCollapse("mine collapse"),
  mineCollapseUnderscore("mine_collapse"),
  miningExplosion("mining explosion"),
  miningExplosionUnderscore("mining_explosion"),
  notExisting("not existing"),
  notReported("not reported"),
  notReportedUnderscore("not_reported"),
  nuclearExplosion("nuclear explosion"),
  nuclearExplosionUnderscore("nuclear_explosion"),
  other("other"),
  otherEvent("other event"),
  otherEventUnderscore("other_event"),
  quarry("quarry"),
  quarryBlast("quarry blast"),
  quarryBlastUnderscore("quarry_blast"),
  rockBurst("rock burst"),
  rockSlide("Rock Slide"),
  rockslide("rockslide"),
  rockBurstUnderscore("rock_burst"),
  snowAvalanche("snow avalanche"),
  snowAvalancheUnderscore("snow_avalanche"),
  sonicBoom("sonic boom"),
  sonicBoomNoSpace("sonicboom"),
  sonicBoomUnderscore("sonic_boom"),
  trainCrash("train crash"),
  volcanicEruption("volcanic eruption"),
  volcanicExplosion("volcanic explosion");

  final String value;
  const EventType(this.value);
}