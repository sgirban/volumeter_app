import 'package:volumeter/core/theme/app_colors.dart';

AppColors getColorsFromTheme(String theme) {
  if (theme == 'atom_light') {
    return AppColors.atomLight();
  }
  if (theme == 'atom_dark') {
    return AppColors.atomDark();
  }
  if (theme == 'midnight') {
    return AppColors.midnight();
  }
  return AppColors.atomLight();
}
