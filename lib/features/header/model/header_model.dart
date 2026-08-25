class HeaderModel {
  final String name;
  final String role;
  final String badgeTag;
  final String profileAsset;
  final List<MetricItem> metrics;

  const HeaderModel({
    required this.name,
    required this.role,
    required this.badgeTag,
    required this.profileAsset,
    required this.metrics,
  });
}

class MetricItem {
  final String count;
  final String label;

  const MetricItem({required this.count, required this.label});
}
