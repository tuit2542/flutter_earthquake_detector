import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';

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

Color magnitudeColor(double magnitude) {
  if (magnitude >= 6.5) {
    return SystemColors.textRejectColor;
  } else if (magnitude >= 3.5) {
    return SystemColors.textWaitingColor;
  } else if (magnitude >= 2.5) {
    return SystemColors.systemWarningColor;
  } else {
    return SystemColors.textDoneColor;
  }
}
