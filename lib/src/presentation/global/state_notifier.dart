import 'package:flutter/material.dart';

abstract class StateNotifier<State> extends ChangeNotifier {
  State _state, _oldState;
  bool _mounted = true;
  final List<VoidCallback> _pendingListeners = [];

  StateNotifier(this._state) : _oldState = _state;

  State get state => _state;
  State get oldState => _oldState;
  bool get mounted => _mounted;

  set state(State newState) {
    _update(newState);
  }

  void onlyUpdate(State newState) {
    _update(newState, notify: false);
  }

  void _update(
    State newState, {
    bool notify = true,
  }) {
    if (newState != _state) {
      _oldState = _state;
      _state = newState;
      if (notify) {
        _addPendingListener(notifyListeners);
      }
    }
  }

  void _addPendingListener(VoidCallback listener) {
    _pendingListeners.add(listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final listener in _pendingListeners) {
        listener();
      }
      _pendingListeners.clear();
    });
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
