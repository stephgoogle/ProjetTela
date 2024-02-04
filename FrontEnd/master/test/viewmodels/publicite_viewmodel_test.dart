import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PubliciteViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
