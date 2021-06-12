part of firebase_remote_config_hybrid;

class RemoteConfigValue {
  final String Function() asString;
  final int Function() asInt;
  final double Function() asDouble;
  final bool Function() asBool;
  final ValueSource Function() getSource;

  RemoteConfigValue._({
    this.asString,
    this.asInt,
    this.asDouble,
    this.asBool,
    this.getSource,
  });

  factory RemoteConfigValue._fromPlatform(
      PlatformRemoteConfigValue platformValue) {
    return platformValue == null
        ? null
        : RemoteConfigValue._(
            asString: platformValue.asString,
            asBool: platformValue.asBool,
            asDouble: platformValue.asDouble,
            asInt: platformValue.asInt,
            getSource: platformValue.getSource,
          );
  }
}
