import 'package:hive/hive.dart';
import 'package:volumeter/core/utils/settings/ui_settings.dart';

class UiSettingsAdapter extends TypeAdapter<UiSettings> {
  @override
  final int typeId = 0;

  @override
  UiSettings read(BinaryReader reader) {
    return UiSettings(
      currentTheme: reader.readString(),
      primaryFont: reader.readString(),
      secondary: reader.readString(),
      distractionFreeMode: reader.readBool(),
      enableThemeSwitchButton: reader.readBool(),
      enableLanguageSwitchButton: reader.readBool(),
      paneMode: reader.readString(),
      locale: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UiSettings obj) {
    writer.writeString(obj.currentTheme);
    writer.writeString(obj.primaryFont);
    writer.writeString(obj.secondary);
    writer.writeBool(obj.distractionFreeMode);
    writer.writeBool(obj.enableThemeSwitchButton);
    writer.writeBool(obj.enableLanguageSwitchButton);
    writer.writeString(obj.paneMode);
    writer.writeString(obj.locale);
  }
}
