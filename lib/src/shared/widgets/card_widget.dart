import 'package:corelab_app_challenge/src/shared/theme/app_colors.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final bool? fullWidth;
  final String description;
  final double price;
  final double promotion;
  final String imageProduct;
  final String category;

  const CardWidget({
    super.key,
    this.fullWidth = false,
    this.description = '',
    this.price = 0.0,
    this.promotion = 0.0,
    this.imageProduct = '',
    this.category = '',
  });

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.sizeOf(context).width;
    double heightSize = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: fullWidth! ? double.infinity : null,
      child: Card(
        elevation: 0.2,
        child: category != ''
            ? Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  category,
                  style: AppTypography().textListCategories,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 600
                          ? widthSize * 0.35
                          : widthSize * 0.2,
                      height: MediaQuery.of(context).size.width < 600
                          ? heightSize * 0.15
                          : heightSize * 0.1,
                      child: Image.asset(imageProduct),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          promotion != 0.0
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 6.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors().textLightBlue,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4.0))),
                                  child: Text(
                                    "${(promotion * 100).toInt()}% OFF",
                                    style: AppTypography().textDiscount,
                                  ),
                                )
                              : Container(),
                          Container(
                            padding: promotion != 0.0
                                ? null
                                : const EdgeInsets.only(
                                    bottom: 10.0,
                                    top: 5.0,
                                  ),
                            width: MediaQuery.of(context).size.width < 600
                                ? widthSize * 0.5
                                : widthSize * 0.2,
                            child: Text(
                              description,
                              style: AppTypography().textTitleProduct,
                            ),
                          ),
                          promotion != 0.0
                              ? Container(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    "R\$${((promotion * price) + price).toStringAsFixed(2)}",
                                    style: AppTypography()
                                        .textPriceWithoutDiscount,
                                  ),
                                )
                              : Container(),
                          Text(
                            "R\$${price.toStringAsFixed(2)}",
                            style: AppTypography().textTitleAndPrice,
                          ),
                          Text(
                            "Em até 3x de R\$${(price / 3).toStringAsFixed(2)}",
                            style: AppTypography().textInstallmentPrice,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "NOVO",
                              style: AppTypography().textProductCondition,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
