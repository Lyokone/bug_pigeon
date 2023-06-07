import 'package:flutter_test/flutter_test.dart';
import 'package:bug_pigeon/bug_pigeon.dart';
import 'package:bug_pigeon/bug_pigeon_platform_interface.dart';
import 'package:bug_pigeon/bug_pigeon_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBugPigeonPlatform
    with MockPlatformInterfaceMixin
    implements BugPigeonPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BugPigeonPlatform initialPlatform = BugPigeonPlatform.instance;

  test('$MethodChannelBugPigeon is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBugPigeon>());
  });

  test('getPlatformVersion', () async {
    BugPigeon bugPigeonPlugin = BugPigeon();
    MockBugPigeonPlatform fakePlatform = MockBugPigeonPlatform();
    BugPigeonPlatform.instance = fakePlatform;

    expect(await bugPigeonPlugin.getPlatformVersion(), '42');
  });
}
