import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

// Box Decorations

BoxDecoration kdbFieldDecortaionLight = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration kdbFieldDecortaionDark =
    BoxDecoration(borderRadius: BorderRadius.circular(10), color: kcMediumGrey);
// Card and Container shape
const RoundedRectangleBorder krrBoxBorderShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
  Radius.circular(10),
));
// Text Styles
const TextStyle ktsButtonTextTextStyle =
    TextStyle(fontWeight: FontWeight.w700, color: kcLDeepGreen, fontSize: 16);
const TextStyle ktsAppTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w600, color: kcWhite, fontSize: 28);
const TextStyle ktsMediumDarkTextStyle = TextStyle(
    fontWeight: FontWeight.w400, color: kcSecondaryColor, fontSize: 16);
const TextStyle ktsSmallDarkTextStyle = TextStyle(
    fontWeight: FontWeight.w400, color: kcDarkGreyColor, fontSize: 15);
const TextStyle ktsBoldMeidumDarkTextStyle = TextStyle(
    fontWeight: FontWeight.w700, color: kcDarkGreyColor, fontSize: 16);
const TextStyle ktsSmallWhiteTextStyle =
    TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14);
const TextStyle ktsNameTitleDarkTextStyle = TextStyle(
    fontWeight: FontWeight.w700, color: kcPrimaryColorDark, fontSize: 24);
const TextStyle ktsLightGreyMeidumTextStyle =
    TextStyle(fontWeight: FontWeight.w400, color: kcLightGrey, fontSize: 14);
const TextStyle ktsLightGreySmallTextStyle =
    TextStyle(fontWeight: FontWeight.w400, color: kcLightGrey, fontSize: 12);
const TextStyle ktsWhiteMediumTextStyle =
    TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16);
const TextStyle ktsWhiteSmallTextStyle =
    TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14);
const TextStyle ktsDarkSmallTextStyle =
    TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 15);

const TextStyle ktsButtonTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w700, color: kcWhite, fontSize: 18);
// const TextStyle ktsWhiteSmallTextStyle = TextStyle(
//     fontWeight: FontWeight.w600,
//     color: Colors.white,
//
//     fontSize: 14);
// const TextStyle ktsDarkSmallTextStyle = TextStyle(
//     fontWeight: FontWeight.w600,
//     color: Colors.black,
//
//     fontSize: 14);

const TextStyle ktsButtonTitleTextStyleWhite =
    TextStyle(fontWeight: FontWeight.w700, color: kcWhite);

const TextStyle ktsDarkGreyTextStyle =
    TextStyle(color: kcDarkGreyColor, fontSize: 18.0);
const TextStyle ktsGreenBoldTextStyle =
    TextStyle(color: kcPrimaryColor, fontSize: 18.0);

const TextStyle ktsDarkGreyBoldTextStyle = TextStyle(
    color: kcDarkGreyColor, fontSize: 26.0, fontWeight: FontWeight.w800);

const TextStyle ktsBoldTextStyle = TextStyle(fontWeight: FontWeight.bold);

const TextStyle ktsVeryLightGreyBodyTextStyle =
    TextStyle(color: kcVeryLightGrey, fontSize: 20);

const TextStyle ktsVeryGreyTitleTextStyle = TextStyle(
    color: kcVeryLightGrey, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle ktsSignUpTextStyle = TextStyle(color: kcPrimaryColor);

const TextStyle ktsMediumGreyTitleTextStyle =
    TextStyle(color: kcMediumGrey, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle ktsLargDarkTextStyle = TextStyle(
    color: kcPrimaryColorDark, fontSize: 18.0, fontWeight: FontWeight.w800);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 15);
EdgeInsets appSymmetricEdgePadding = const EdgeInsets.symmetric(
  horizontal: 16,
);
EdgeInsets appLeftEdgePadding = const EdgeInsets.only(
  left: 16,
);
const EdgeInsets commonHorizontalPadding10 =
    EdgeInsets.symmetric(horizontal: 20);

// Future fetchPorfile(){
// GraphQlClient _client = _graph configuratin. myGraphClient()};
// if (result.hasExceiption){
// print (result.excption);
// else if (!result.hasException){
// print(result.dat)}}
// profileList = result.data['characters']['resuts'];
//  widget buldCharcter(int index){
// return RoundContainer(padding: Const EdgetInset.90,
// marigin )}
//
