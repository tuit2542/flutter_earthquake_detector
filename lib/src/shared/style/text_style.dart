import 'package:flutter/material.dart';

//Sarabun
const sarabunSmall = TextStyle(
  fontSize: 12,
  fontFamily: 'Sarabun',
  fontWeight: FontWeight.w400,
);
final sarabunSmall1 = sarabunSmall.copyWith(fontSize: 14);
final sarabunBody = sarabunSmall.copyWith(fontSize: 16);
final sarabunTitle = sarabunSmall.copyWith(fontSize: 20);
final sarabunTitleBold = sarabunTitle.copyWith(fontWeight: FontWeight.w700);

//Prompt - Regular
const regularSmall = TextStyle(
  fontSize: 10,
  fontFamily: 'Prompt',
  fontWeight: FontWeight.w400,
);
final regularSmall1 = regularSmall.copyWith(fontSize: 12);
final regularSmall2 = regularSmall.copyWith(fontSize: 14);
final regularBody = regularSmall.copyWith(fontSize: 16);

//Prompt - Semi Bold
const statusSemiBold = TextStyle(
  fontSize: 12,
  fontFamily: 'Prompt',
  fontWeight: FontWeight.w600,
);
final buttonSemiBold = statusSemiBold.copyWith(fontSize: 16);
final titleSemiBold = statusSemiBold.copyWith(fontSize: 20);

//Prompt - Bold
const headerBold4 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  fontFamily: 'Prompt',
);
final headerBold3 = headerBold4.copyWith(fontSize: 24);
final headerBold2 = headerBold4.copyWith(fontSize: 32);
final headerBold1 = headerBold4.copyWith(fontSize: 48);
