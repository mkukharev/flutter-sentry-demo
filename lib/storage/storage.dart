class _LocalStorageItems {
  static const user = 'user';
  static const language = 'language';
}

class _InternalDataCache {
  static bool isLoggedIn = false;
}

class LocalStorage {
  static const _objectStoreName = 'receptioner';

  static initData() async {
    // in the real code it's
    // reading a lot of data from an internal storage,
    // doing some checks, default some data etc.
  }
}
