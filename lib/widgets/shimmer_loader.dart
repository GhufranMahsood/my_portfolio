import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_portfolio/config/theme/app_theme.dart';
import 'package:my_portfolio/config/utils/extensions.dart';

class ShimmerLoader extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;    

  const ShimmerLoader.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerLoader.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  ShimmerLoader.rounded({
    super.key,
    this.width = double.infinity,
    required this.height,
    double borderRadius = 12,
  }) : shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseColor = customTheme?.shimmerBase ??
        (isDark ? const Color(0xFF1E293B) : Colors.grey[300]!);
    final highlightColor = customTheme?.shimmerHighlight ??
        (isDark ? const Color(0xFF334155) : Colors.grey[100]!);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: baseColor,
          shape: shapeBorder,
        ),
      ),
    );
  }
}

class ListShimmer extends StatelessWidget {
  final int itemCount;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const ListShimmer({
    super.key,
    this.itemCount = 5,
    this.height = 100,
    this.borderRadius = 16,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding ?? 20.allPadding,
      itemCount: itemCount,
      separatorBuilder: (_, _) => 16.verSpace,
      itemBuilder: (_, _) => ShimmerLoader.rounded(
        height: height,
        borderRadius: borderRadius,
      ),
    );
  }
}
