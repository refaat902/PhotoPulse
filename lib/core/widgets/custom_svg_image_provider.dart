import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSVGImageProvider extends StatelessWidget {
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final String imagePath;
  final void Function()? onTap;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Color? iamgeColor;

  const CustomSVGImageProvider({
    Key? key,
    this.boxFit,
    this.height,
    this.width,
    required this.imagePath,
    this.onTap,
    this.margin,
    this.alignment,
    this.iamgeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          margin: margin,
          alignment: alignment ?? Alignment.center,
          child: imagePath.startsWith('asset')
              ? SvgPicture.asset(
                  imagePath,
                  fit: boxFit ?? BoxFit.fill,
                  height: height,
                  width: width,
                  color: iamgeColor,
                )
              : imagePath.startsWith('http')
                  ? SvgPicture.network(
                      imagePath,
                      fit: boxFit ?? BoxFit.fill,
                      height: height,
                      width: width,
                    )
                  : SvgPicture.file(
                      File(imagePath),
                      fit: boxFit ?? BoxFit.fill,
                      height: height,
                      width: width,
                    ),
        ),
      );
}
