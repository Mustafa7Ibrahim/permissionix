import 'package:flutter/material.dart';
import 'package:permissionix/permissionix.dart';

void main() {
  final List<String> allPermissions = <String>[
    'access_profile',
    "add_to_cart",
  ];

  final List<String> userPermissions = <String>[
    'access_profile',
  ];

  final permissionManager = PermissionixManager<String>();

  permissionManager.allPermissions = allPermissions;
  permissionManager.userPermissions = userPermissions;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permissionix Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Permissionix Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Does user have access to access_profile?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Permissionix<String>(
              permission: 'access_profile',
              replacement: Text('Access Denied'),
              child: Text('Yes'),
            ),
            SizedBox(height: 20),
            Text(
              "Does user have access to add_to_cart?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Permissionix<String>(
              permission: 'add_to_cart',
              replacement: Text('Access Denied'),
              child: Text('Dashboard Content'),
            )
          ],
        ),
      ),
    );
  }
}
