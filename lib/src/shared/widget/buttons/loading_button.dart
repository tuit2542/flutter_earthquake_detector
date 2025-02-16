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
    this.buttonDisableColor = EssColors.thirdNeutralGreyColor,
    this.buttonColor = EssColors.primaryBlueColor,
    this.textColor = Colors.white,
    this.highlightColor = EssColors.hoverColor,
    this.pressColor = EssColors.pressColor,
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
                color: EssColors.primaryWhaleBlueColor,
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
      return EssColors.approveColor;

    case "revise":
      return EssColors.reviseColor;

    case "waiting":
      return EssColors.waitingColor;

    case "reject":
      return EssColors.rejectColor;

    case "done":
      return EssColors.doneColor;

    case "draft":
      return EssColors.draftColor;

    case "verify":
      return EssColors.verifyColor;

    case "inactive":
      return EssColors.secondNeutralGreyColor;

    case "active":
      return EssColors.systemSuccessColor;

    default:
      return EssColors.secondNeutralWhiteColor;
  }
}

Color checkStatusTextColor(String check) {
  switch (check.trim().toLowerCase()) {
    case "approve":
      return EssColors.textAproveColor;

    case "revise":
      return EssColors.textReviseColor;

    case "waiting":
      return EssColors.textWaitingColor;

    case "reject":
      return EssColors.textRejectColor;

    case "done":
      return EssColors.textDoneColor;

    case "draft":
      return EssColors.textDraftColor;

    case "verify":
      return EssColors.textVerifyColor;

    case "inactive":
      return EssColors.fourthNeutralGreyColor;

    case "active":
      return Colors.white;

    default:
      return Colors.black;
  }
}
