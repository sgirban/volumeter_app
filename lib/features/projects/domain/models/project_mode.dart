/// A way to specify the  mode in which project should operate
///
/// Usually used inside a `ProjectMetatada`
enum ProjectMode {
  singleRGB("singleRGB", "Single RGB"),
  multipleRGB("multipleRGB", "Multiple RGB"),
  singleRGBD("singleRGBD", "Single RGBD"),
  multipleRGBD("multipleRGBD", "Multiple RGBD"),
  auto("auto", "Auto");

  final String value;
  final String label;
  // Project mode
  /// Project mode is used to create a new project
  const ProjectMode(this.value, this.label);
  bool get isRGB =>
      this == ProjectMode.auto ||
      this == ProjectMode.singleRGB ||
      this == ProjectMode.multipleRGB;
  bool get isRGBD =>
      this == ProjectMode.auto ||
      this == ProjectMode.singleRGBD ||
      this == ProjectMode.multipleRGBD;
}
