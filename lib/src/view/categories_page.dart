import 'package:corelab_app_challenge/src/controller/product_controller.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';

import 'package:corelab_app_challenge/src/shared/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoriesPage extends StatefulWidget {
  final String description;
  final double price;
  final double promotion;
  final String imageProduct;
  final String category;
  const CategoriesPage(
      {this.description = '',
      this.price = 0.0,
      this.promotion = 0.0,
      this.imageProduct = '',
      this.category = '',
      super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final productController = ProductController();

  @override
  void initState() {
    productController.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productController.isSelectedCategory
                      ? Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                productController.isSelectedCategory = false;
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            Text(
                              'Resultados',
                              style: AppTypography().textTitleAndPrice,
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          child: Text(
                            'Categorias',
                            style: AppTypography().textTitleAndPrice,
                          ),
                        ),
                  if (MediaQuery.of(context).size.width < 600)
                    if (productController.isSelectedCategory)
                      ...productController.productsInMemory.map((product) {
                        return CardWidget(
                          description: product.description!,
                          price: product.price!,
                          promotion: product.promotion!,
                          imageProduct: product.imageProduct!,
                        );
                      })
                    else
                      ...groupCategories(),
                  if (MediaQuery.of(context).size.width >= 600)
                    GridView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.8,
                      ),
                      children: [
                        if (productController.isSelectedCategory)
                          ...productController.productsInMemory.map((product) {
                            return CardWidget(
                              description: product.description!,
                              price: product.price!,
                              promotion: product.promotion!,
                              imageProduct: product.imageProduct!,
                            );
                          })
                        else
                          ...groupCategories(),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> groupCategories() {
    return [
      ...productController.categories.map(
        (category) {
          return GestureDetector(
            onTap: () {
              productController.filterSearchResults(category.description!);
              print(category.description!);
              productController.isSelectedCategory = true;
            },
            child: CardWidget(
              fullWidth: true,
              category: category.description!,
            ),
          );
        },
      ),
    ];
  }
}
