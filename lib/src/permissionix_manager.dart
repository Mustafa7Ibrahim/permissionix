/// A singleton class for managing permissions.
///
/// This class allows you to define a list of all available permissions and
/// a list of permissions assigned to a user. It provides methods to check
/// if a user has a specific permission.
class PermissionixManager<T> {
  /// Factory constructor to return the singleton instance per type
  factory PermissionixManager() {
    return _instances.putIfAbsent(
      T,
      PermissionixManager<T>._,
    ) as PermissionixManager<T>;
  }
  // Private constructor for singleton
  PermissionixManager._();

  // A static map to store instances of different generic types
  static final Map<Type, dynamic> _instances = {};

  /// List of all available permissions.
  final List<T> _allPermissions = [];

  /// List of permissions assigned to the user.
  final List<T> _userPermissions = [];

  /// Returns an unmodifiable list of all available permissions.
  List<T> get allPermissions => List.unmodifiable(_allPermissions);

  /// Sets the list of all available permissions.
  ///
  /// This clears the previous list and replaces it with the provided [permissions].
  set allPermissions(List<T> permissions) {
    _allPermissions
      ..clear()
      ..addAll(permissions);
  }

  /// Returns an unmodifiable list of permissions assigned to the user.
  List<T> get userPermissions => List.unmodifiable(_userPermissions);

  /// Sets the list of permissions assigned to the user.
  ///
  /// This clears the previous list and replaces it with the provided [permissions].
  set userPermissions(List<T> permissions) {
    _userPermissions
      ..clear()
      ..addAll(permissions);
  }

  /// Checks if the user has a specific [permission].
  ///
  /// Returns `true` if the user has the permission, otherwise `false`.
  bool hasPermission(T permission) => _userPermissions.contains(permission);
}
