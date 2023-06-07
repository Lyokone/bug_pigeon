import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bug_pigeon_method_channel.dart';

abstract class BugPigeonPlatform extends PlatformInterface {
  /// Constructs a BugPigeonPlatform.
  BugPigeonPlatform() : super(token: _token);

  static final Object _token = Object();

  static BugPigeonPlatform _instance = MethodChannelBugPigeon();

  /// The default instance of [BugPigeonPlatform] to use.
  ///
  /// Defaults to [MethodChannelBugPigeon].
  static BugPigeonPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BugPigeonPlatform] when
  /// they register themselves.
  static set instance(BugPigeonPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
