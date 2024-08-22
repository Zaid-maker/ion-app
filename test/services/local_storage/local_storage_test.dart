import 'package:flutter_test/flutter_test.dart';
import 'package:ice/app/services/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TestEnum { one, two, three }

const testKey = 'testKey';
const testStringValue = 'testValue';
const testBoolValue = true;
const testDoubleValue = 1.5;
final testEnumValue = TestEnum.two;

void main() {
  late LocalStorage localStorage;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    localStorage = LocalStorage(prefs);
  });

  group('LocalStorage', () {
    test('setBool() and getBool()', () {
      localStorage.setBool(key: testKey, value: testBoolValue);

      expect(localStorage.getBool(testKey), testBoolValue);
    });

    test('getBool() returns default value when key not found', () {
      expect(
        localStorage.getBool(testKey, defaultValue: !testBoolValue),
        !testBoolValue,
      );
    });

    test('setDouble() and getDouble()', () {
      localStorage.setDouble(testKey, testDoubleValue);

      expect(localStorage.getDouble(testKey), testDoubleValue);
    });

    test('getDouble() returns default value when key not found', () {
      expect(
        localStorage.getDouble(testKey, defaultValue: 0.0),
        0.0,
      );
    });

    test('setString() and getString()', () {
      localStorage.setString(testKey, testStringValue);

      expect(
        localStorage.getString(testKey),
        testStringValue,
      );
    });

    test('setEnum() and getEnum()', () {
      localStorage.setEnum(testKey, testEnumValue);

      expect(
        localStorage.getEnum(
          testKey,
          TestEnum.values,
          defaultValue: TestEnum.one,
        ),
        testEnumValue,
      );
    });

    test('getEnum() returns default value when key not found', () {
      expect(
        localStorage.getEnum(
          testKey,
          TestEnum.values,
          defaultValue: TestEnum.one,
        ),
        TestEnum.one,
      );
    });

    test('getEnum() returns default value when value is invalid', () {
      localStorage.setString(testKey, 'invalid');

      expect(
        localStorage.getEnum(
          testKey,
          TestEnum.values,
          defaultValue: TestEnum.one,
        ),
        TestEnum.one,
      );
    });
  });
}