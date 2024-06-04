import 'package:dsh/dsh.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect($("echo hello"), isTrue);
    });
  });
}
