import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permissionix/permissionix.dart';

void main() {
  group('Permissionix Widget Tests', () {
    testWidgets('Displays child when permission is granted', (
      WidgetTester tester,
    ) async {
      PermissionixManager<String>()
        ..allPermissions = ['view_dashboard']
        ..userPermissions = ['view_dashboard'];

      await tester.pumpWidget(
        const MaterialApp(
          home: Permissionix<String>(
            permission: 'view_dashboard',
            child: Text('Allowed'),
          ),
        ),
      );

      expect(find.text('Allowed'), findsOneWidget);
    });

    testWidgets('Displays replacement when permission is denied', (
      WidgetTester tester,
    ) async {
      PermissionixManager<String>()
        ..allPermissions = ['view_dashboard']
        ..userPermissions = [];

      await tester.pumpWidget(
        const MaterialApp(
          home: Permissionix<String>(
            permission: 'view_dashboard',
            replacement: Text('Denied'),
            child: Text('Allowed'),
          ),
        ),
      );

      expect(find.text('Allowed'), findsNothing);
      expect(find.text('Denied'), findsOneWidget);
    });

    testWidgets('Hides widget when permission is denied and no replacement', (
      WidgetTester tester,
    ) async {
      PermissionixManager<String>()
        ..allPermissions = ['view_dashboard']
        ..userPermissions = [];

      await tester.pumpWidget(
        const MaterialApp(
          home: Permissionix<String>(
            permission: 'view_dashboard',
            child: Text('Allowed'),
          ),
        ),
      );

      expect(find.text('Allowed'), findsNothing);
    });
  });
}
