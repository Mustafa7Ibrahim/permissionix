import 'package:flutter_test/flutter_test.dart';
import 'package:permissionix/src/permissionix_manager.dart';

void main() {
  group('PermissionixManager', () {
    late PermissionixManager<String> manager;

    setUp(() {
      manager = PermissionixManager<String>()
        ..allPermissions = ['read', 'write', 'delete']
        ..userPermissions = ['read', 'write'];
    });

    test('should return all permissions as unmodifiable list', () {
      expect(manager.allPermissions, equals(['read', 'write', 'delete']));
      expect(
        () => manager.allPermissions.add('update'),
        throwsUnsupportedError,
      );
    });

    test('should return user permissions as unmodifiable list', () {
      expect(manager.userPermissions, equals(['read', 'write']));
      expect(
        () => manager.userPermissions.add('delete'),
        throwsUnsupportedError,
      );
    });

    test('should correctly check if user has a specific permission', () {
      expect(manager.hasPermission('read'), isTrue);
      expect(manager.hasPermission('write'), isTrue);
      expect(manager.hasPermission('delete'), isFalse);
    });

    test('should update all permissions correctly', () {
      manager.allPermissions = ['update', 'manage'];
      expect(manager.allPermissions, equals(['update', 'manage']));
    });

    test('should update user permissions correctly', () {
      manager.userPermissions = ['update'];
      expect(manager.userPermissions, equals(['update']));
    });

    test('should return false for non-existent permissions', () {
      expect(manager.hasPermission('unknown'), isFalse);
    });
  });
}
