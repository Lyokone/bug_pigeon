import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bug_pigeon_platform_interface.dart';

/// An implementation of [BugPigeonPlatform] that uses method channels.
class MethodChannelBugPigeon extends BugPigeonPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bug_pigeon');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
