#include "include/bug_pigeon/bug_pigeon_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "bug_pigeon_plugin.h"

void BugPigeonPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  bug_pigeon::BugPigeonPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
