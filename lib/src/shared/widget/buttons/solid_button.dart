import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';
import 'package:flutter_earthquake_detector/src/shared/style/text_style.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.disable = false,
    this.fontSize = 16,
    this.borderRadius = 4,
    this.onClick,
    this.margin = const EdgeInsets.fromLTRB(0, 10, 0, 0),
    this.buttonDisableColor = SystemColors.thirdNeutralGreyColor,
    this.buttonColor = SystemColors.primaryBlueColor,
    this.textColor = Colors.white,
    this.highlightColor = SystemColors.hoverColor,
    this.pressColor = SystemColors.pressColor,
  });

  final String label;

  final double? width;

  final double? height;

  final bool disable;

  final double fontSize;

  final double borderRadius;

  final VoidCallback? onClick;

  final EdgeInsetsGeometry? margin;

  final Color buttonColor;

  final Color buttonDisableColor;

  final Color textColor;

  final Color highlightColor;

  final Color pressColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: disable ? buttonDisableColor : buttonColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: disable
          ? Center(
              child: Text(
                label,
                style: statusSemiBold.copyWith(color: textColor),
              ),
            )
          : Material(
              color: Colors.transparent,
              child: InkWell(
                hoverColor: highlightColor,
                highlightColor: highlightColor,
                splashColor: SystemColors.pressColor,
                borderRadius: BorderRadius.circular(borderRadius),
                onTap: onClick,
                child: Center(
                  child: Text(
                    label,
                    style: statusSemiBold.copyWith(
                      color: textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
