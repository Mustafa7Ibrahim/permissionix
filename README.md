# Permissionix

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]  [![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)  [![License: BSD 3-Clause][license_badge]][license_link]  

A lightweight and flexible package for managing user permissions in Flutter applications.

## Features ✨
- Define and manage permissions dynamically.
- Check user permissions before displaying UI components.
- Easily integrate with backend-driven permission systems.

---

## Installation 💻

**❗ Ensure that you have the [Flutter SDK][flutter_install_link] installed before using Permissionix.**

Add Permissionix to your project using:

```sh
dart pub add permissionix
```

Or add it manually to your `pubspec.yaml`:

```yaml
dependencies:
  permissionix: latest_version
```

Then, run:

```sh
flutter pub get
```

---

## Usage 🚀

Import the package:

```dart
import 'package:permissionix/permissionix.dart';
```

### Checking Permissions

```dart
final permissionManager = PermissionixManager<String>();
permissionManager.userPermissions = ['view_dashboard'];

if (permissionManager.hasPermission('view_dashboard')) {
  print('User has access to the dashboard');
} else {
  print('Access denied');
}
```

### Using Permissionix Widget

```dart
Permissionix<String>(
  permission: 'view_dashboard',
  child: Text('Dashboard Content'),
  replacement: Text('Access Denied'),
)
```

---

## Continuous Integration 🤖

Permissionix includes a [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link]. The CI setup ensures that code is consistently formatted, linted, and tested before merging changes.

By default, every push and pull request triggers:
- Code formatting checks
- Linting (using [Very Good Analysis][very_good_analysis_link])
- Unit tests with coverage enforcement


## License 📄

Permissionix is released under the [MIT License][license_link].

---

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-BSD--3--Clause-blue.svg
[license_link]: https://opensource.org/licenses/BSD-3-Clause
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
