import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/shared/style/text_style.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';

class LodingButton extends StatelessWidget {
  const LodingButton({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.disable = false,
    this.fontSize = 16,
    this.borderRadius = 4,
    this.onClick,
    this.margin = const EdgeInsets.fromLTRB(0, 10, 0, 0),
    this.isUpdate = false,
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

  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return isUpdate
        ? const Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: SystemColors.primaryWhaleBlueColor,
              ),
            ),
          )
        : Container(
            margin: margin,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                splashColor: pressColor,
                onTap: onClick,
                child: Center(
                  child: Text(
                    label == "Verify" ? "Waiting" : label,
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

Color checkStatusButtonTypeColor(String check) {
  switch (check.trim().toLowerCase()) {
    case "approve":
      return SystemColors.approveColor;

    case "revise":
      return SystemColors.reviseColor;

    case "waiting":
      return SystemColors.waitingColor;

    case "reject":
      return SystemColors.rejectColor;

    case "done":
      return SystemColors.doneColor;

    case "draft":
      return SystemColors.draftColor;

    case "verify":
      return SystemColors.verifyColor;

    case "inactive":
      return SystemColors.secondNeutralGreyColor;

    case "active":
      return SystemColors.systemSuccessColor;

    default:
      return SystemColors.secondNeutralWhiteColor;
  }
}

Color checkStatusTextColor(String check) {
  switch (check.trim().toLowerCase()) {
    case "approve":
      return SystemColors.textAproveColor;

    case "revise":
      return SystemColors.textReviseColor;

    case "waiting":
      return SystemColors.textWaitingColor;

    case "reject":
      return SystemColors.textRejectColor;

    case "done":
      return SystemColors.textDoneColor;

    case "draft":
      return SystemColors.textDraftColor;

    case "verify":
      return SystemColors.textVerifyColor;

    case "inactive":
      return SystemColors.fourthNeutralGreyColor;

    case "active":
      return Colors.white;

    default:
      return Colors.black;
  }
}
