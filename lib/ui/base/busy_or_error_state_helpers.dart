import 'package:flutter/foundation.dart';

mixin BusyOrErrorStateHelpers on ChangeNotifier {
  final Map<int, bool> _busyStates = <int, bool>{};

  /// Returns the busy status for an object if it exists. Returns false if not present
  bool busy(Object? object) => _busyStates[object.hashCode] ?? false;

  /// Returns the busy status of the ViewModel
  bool get isBusy => busy(this);

  /// Sets the busy state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setBusyForObject(Object? object, bool value) {
    _busyStates[object.hashCode] = value;
    notifyListeners();
  }

  /// Marks the ViewModel as busy and calls notify listeners
  void setBusy(bool value) {
    setBusyForObject(this, value);
  }

  final Map<int, dynamic> _errorStates = <int, bool>{};

  /// Returns the error status for an object if it exists. Returns false if not present
  bool error(Object? object) => _errorStates[object.hashCode] ?? false;

  /// Returns the error existence status of the ViewModel
  bool get hasError => error(this);

  /// Sets the error state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setErrorForObject(Object? object, bool value) {
    _errorStates[object.hashCode] = value;
    notifyListeners();
  }

  /// Sets the error for the ViewModel
  void setError(bool error) {
    setErrorForObject(this, error);
  }
}
