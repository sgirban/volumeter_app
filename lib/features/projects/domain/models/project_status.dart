enum ProjectStatus {
  pending("pending", "Pending"),
  processing("processing", "Processing"),
  completed("completed", "Completed");

  final String value;
  final String label;
  const ProjectStatus(this.value, this.label);
}
