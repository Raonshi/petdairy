enum GrowthType {
  baby('베이비'),
  juvenile('준성체'),
  adult('성체'),
  unknown('알 수 없음');

  const GrowthType(this.string);
  final String string;
}

enum AnimalType {
  mammal('포유류'),
  fish('어류'),
  bird('조류'),
  reptile('파충류'),
  amphibians('양서류'),
  insect('곤충 / 절지류'),
  unknown('알 수 없음');

  const AnimalType(this.string);
  final String string;
}

enum SexType {
  male('수컷'),
  female('암컷'),
  unknown('알 수 없음');

  const SexType(this.string);
  final String string;
}

enum RoutineType {
  feed('먹이'),
  cleaning('청소'),
  washing('목욕'),
  health('건강'),
  play('놀이'),
  etc('기타');

  const RoutineType(this.string);
  final String string;
}
