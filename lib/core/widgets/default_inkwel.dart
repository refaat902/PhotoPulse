import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultInkwel extends StatelessWidget {
  const DefaultInkwel({super.key,this.onTap,this.child});

  final void Function()? onTap ;
  final Widget? child ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: child,
      ),
    );
  }
}
