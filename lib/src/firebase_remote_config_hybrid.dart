part of firebase_remote_config_hybrid;

class FirebaseRemoteConfig {
  FirebaseRemoteConfigPlatformInterface _platformInstance;
  FirebaseRemoteConfig._(FirebaseRemoteConfigPlatformInterface platformInstance)
      : _platformInstance = platformInstance;

  static Future<FirebaseRemoteConfig> get instance async =>
      FirebaseRemoteConfig._(
          await FirebaseRemoteConfigPlatformInterface.getinstance());

  RemoteConfigValue getValue(String key) {
    return RemoteConfigValue._fromPlatform(_platformInstance?.getValue(key));
  }

  int getInt(String key) {
    return _platformInstance?.getInt(key);
  }

  double getDouble(String key) {
    return _platformInstance?.getDouble(key);
  }

  String getString(String key) {
    return _platformInstance?.getString(key);
  }

  Map<String, RemoteConfigValue> getAll() {
    Map<String, PlatformRemoteConfigValue> platformMap =
        _platformInstance?.getAll();
    Map<String, RemoteConfigValue> result = {};
    if (platformMap == null) return null;
    for (String key in platformMap.keys) {
      result[key] = RemoteConfigValue._fromPlatform(platformMap[key]);
    }
    return result;
  }

  Future<void> fetch({Duration expiration: const Duration(hours: 12)}) async {
    await _platformInstance?.fetch(expiration: expiration);
  }

  Future<bool> activateFetched() async {
    return await _platformInstance?.activateFetched();
  }

  LastFetchStatus get lastFetchStatus => _platformInstance?.lastFetchStatus;

  DateTime get lastFetchTime => _platformInstance?.lastFetchTime;
}
