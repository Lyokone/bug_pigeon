#ifndef FLUTTER_PLUGIN_BUG_PIGEON_PLUGIN_H_
#define FLUTTER_PLUGIN_BUG_PIGEON_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace bug_pigeon {

class BugPigeonPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BugPigeonPlugin();

  virtual ~BugPigeonPlugin();

  // Disallow copy and assign.
  BugPigeonPlugin(const BugPigeonPlugin&) = delete;
  BugPigeonPlugin& operator=(const BugPigeonPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace bug_pigeon

#endif  // FLUTTER_PLUGIN_BUG_PIGEON_PLUGIN_H_
