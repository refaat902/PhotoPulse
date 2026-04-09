import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_color.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({
    required this.height,
    required this.width,
    required this.radius,
    this.isChild = false,
    this.child,
    this.margin,
    this.padding,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final Widget? child;
  final bool isChild;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation opcityAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    opcityAnimation = Tween<double>(
            begin: widget.isChild ? 1 : 0.8, end: widget.isChild ? 0.5 : 0.3)
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.repeat(reverse: true);
    // Start the animation when the widget is first built
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opcityAnimation.value,
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        width: widget.width.w,
        height: widget.height.h,
        decoration: BoxDecoration(
          color: widget.isChild
              ? AppColors.textFormFieldHintText
              : AppColors.textFormFieldBorderSide,
          borderRadius: BorderRadius.circular(widget.radius.r),
        ),
        child: widget.child,
      ),
    );
  }
}
