import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tugla_kirma/oyun_tugla_kirma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tuglaConfig.title.length, 33);
    expect(tuglaConfig.tagline.length, 33);
    for (final s in tuglaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tuglaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tuglaId, optionalMechanics: tuglaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tuglaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
