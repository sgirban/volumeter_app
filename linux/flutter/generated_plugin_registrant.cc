//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_acrylic/flutter_acrylic_plugin.h>
#include <irondash_engine_context/irondash_engine_context_plugin.h>
#include <screen_retriever_linux/screen_retriever_linux_plugin.h>
#include <super_native_extensions/super_native_extensions_plugin.h>
#include <window_manager/window_manager_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_acrylic_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterAcrylicPlugin");
  flutter_acrylic_plugin_register_with_registrar(flutter_acrylic_registrar);
  g_autoptr(FlPluginRegistrar) irondash_engine_context_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "IrondashEngineContextPlugin");
  irondash_engine_context_plugin_register_with_registrar(irondash_engine_context_registrar);
  g_autoptr(FlPluginRegistrar) screen_retriever_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ScreenRetrieverLinuxPlugin");
  screen_retriever_linux_plugin_register_with_registrar(screen_retriever_linux_registrar);
  g_autoptr(FlPluginRegistrar) super_native_extensions_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SuperNativeExtensionsPlugin");
  super_native_extensions_plugin_register_with_registrar(super_native_extensions_registrar);
  g_autoptr(FlPluginRegistrar) window_manager_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WindowManagerPlugin");
  window_manager_plugin_register_with_registrar(window_manager_registrar);
}
