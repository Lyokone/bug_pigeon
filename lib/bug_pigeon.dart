
import 'bug_pigeon_platform_interface.dart';

class BugPigeon {
  Future<String?> getPlatformVersion() {
    return BugPigeonPlatform.instance.getPlatformVersion();
  }
}
