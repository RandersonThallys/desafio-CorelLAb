import 'package:corelab_app_challenge/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppTypography {
  TextStyle get textTitleAndPrice => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors().textDarkBlue,
      );

  TextStyle get textHistoryPublication => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors().textGray,
      );

  TextStyle get textTitleProduct => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColors().textDarkBlue,
      );
  TextStyle get textHintSearchBar => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColors().textGray,
      );
  TextStyle get textQuantityResult => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors().textDarkBlue,
      );

  TextStyle get textInstallmentPrice => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AppColors().textLightBlue,
      );

  TextStyle get textProductCondition => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AppColors().textGray,
      );
  TextStyle get textDiscount => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 10.0,
        fontWeight: FontWeight.w700,
        color: AppColors().textWhite,
      );
  TextStyle get textPriceWithoutDiscount => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors().textGray,
        decoration: TextDecoration.lineThrough,
      );
  TextStyle get textBottomMenu => TextStyle(
        fontFamily: 'CircularSTD',
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        color: AppColors().textLightBlue,
      );
  TextStyle get textListCategories => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: AppColors().textLightBlue,
      );

  TextStyle get textListHistorySearch => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors().textGray,
      );

  TextStyle get textFilterSearchBar => TextStyle(
        fontFamily: 'DMSans',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: AppColors().textWhite,
      );
}
