import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/shared/style/text_style.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.disable = false,
    this.fontSize = 16,
    this.borderRadius = 4,
    this.onClick,
    this.margin = const EdgeInsets.fromLTRB(0, 10, 0, 0),
    this.outlineDisableColor = SystemColors.thirdNeutralGreyColor,
    this.outlineColor = SystemColors.primaryBlueColor,
    this.textColor = SystemColors.thirdNeutralGreyColor,
  });

  final String label;

  final double? width;

  final double? height;

  final bool disable;

  final double fontSize;

  final double borderRadius;

  final VoidCallback? onClick;

  final EdgeInsetsGeometry? margin;

  final Color outlineDisableColor;

  final Color outlineColor;

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: disable ? outlineDisableColor : outlineColor,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: disable
          ? Center(
              child: Text(
                label,
                style: statusSemiBold.copyWith(
                  color: textColor,
                ),
              ),
            )
          : Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                onTap: onClick,
                child: Center(
                  child: Text(
                    label,
                    style: statusSemiBold.copyWith(
                      fontSize: fontSize,
                      color: disable ? outlineDisableColor : outlineColor,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
