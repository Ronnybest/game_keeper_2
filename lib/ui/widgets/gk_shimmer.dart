import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GKShimmerGenerator extends StatelessWidget {
  final int count;
  final Axis? axisDirection;
  final double? height;
  final double? width;
  final double? borderRadius;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? listPadding;

  const GKShimmerGenerator({
    super.key,
    required this.count,
    this.axisDirection = Axis.vertical,
    this.physics,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.margin,
    this.listPadding,
  });

  @override
  Widget build(BuildContext context) {
    if (axisDirection == Axis.vertical) {
      return Padding(
        padding: margin ?? const EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: physics,
          child: Padding(
            padding: listPadding ?? const EdgeInsets.all(0),
            child: Column(
              children: List.generate(
                  count,
                  (index) => Padding(
                        padding: padding ?? const EdgeInsets.only(bottom: 16),
                        child: ShimmerElement(
                          height: height ?? 64,
                          width:
                              width ?? MediaQuery.of(context).size.width - 32,
                          radius: BorderRadius.circular(borderRadius ?? 12),
                        ),
                      )),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: margin ?? const EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: listPadding ?? const EdgeInsets.only(),
            child: Row(
              children: List.generate(
                  count,
                  (index) => Padding(
                        padding: padding ?? const EdgeInsets.only(bottom: 16),
                        child: ShimmerElement(
                          height: height ?? 64,
                          width:
                              width ?? MediaQuery.of(context).size.width - 32,
                          radius: BorderRadius.circular(borderRadius ?? 12),
                        ),
                      )),
            ),
          ),
        ),
      );
    }
  }
}

class ShimmerElement extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius radius;

  const ShimmerElement(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    var currentBrightness = Theme.of(context).brightness;
    return Shimmer.fromColors(
      baseColor: currentBrightness == Brightness.light
          ? const Color.fromARGB(255, 238, 237, 237)
          : const Color.fromARGB(255, 34, 34, 34), // Colors.grey[300] : Colors.grey[800]
      highlightColor: currentBrightness == Brightness.light
          ? const Color(0xffE4E6EA)
          : const Color.fromARGB(255, 49, 45, 45), // Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          color: currentBrightness == Brightness.light
              ? const Color.fromARGB(255, 238, 237, 237)
              : const Color.fromARGB(255, 26, 26, 26),
        ), // Color(0xffE4E6EA)),
        width: width,
        height: height,
      ),
    );
  }
}
