import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';

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

Color magnitudeColor(double magnitude) {
  if (magnitude >= 8) {
    return EssColors.textRejectColor;
  } else if (magnitude >= 5) {
    return EssColors.textWaitingColor;
  } else if (magnitude >= 3) {
    return EssColors.textReviseColor;
  } else {
    return EssColors.textDoneColor;
  }
}
