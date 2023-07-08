import 'package:corelab_app_challenge/src/controller/product_controller.dart';

import 'package:corelab_app_challenge/src/shared/theme/app_colors.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';

import 'package:corelab_app_challenge/src/shared/widgets/search_bar_widget.dart';
import 'package:corelab_app_challenge/src/view/grid_products_page.dart';
import 'package:corelab_app_challenge/src/view/list_products_page.dart';
import 'package:corelab_app_challenge/src/view/recent_research_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = ProductController();
  TextEditingController textEditingController = TextEditingController();
  String queryStringSearch = '';
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    productController.loadProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.sizeOf(context).height;

    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: heightSize * 0.09,
          leading: productController.inSearch
              ? BackButton(
                  onPressed: () {
                    productController.clearSearchResults();
                    focus.unfocus();
                    textEditingController.clear();
                  },
                )
              : null,
          elevation: 0,
          actions: productController.inSearch &&
                  productController.showResults == true
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Center(
                        child: Text(
                      'Filtros',
                      style: AppTypography().textFilterSearchBar,
                    )),
                  ),
                ]
              : null,
          backgroundColor: AppColors().textLightBlue,
          title: SearchBarWidget(
            textEditingController: textEditingController,
            focus: focus,
            onFocusChanged: (hasFocus) {
              if (hasFocus! || textEditingController.text.isNotEmpty) {
                productController.inSearch = true;

                if (textEditingController.text.isEmpty) {
                  productController.showResults = false;
                }
              } else {
                productController.inSearch = false;
                productController.showResults = true;
              }
            },
            onSubmitted: (value) async {
              productController.addListRecentResearches(value!);
              productController.showResults = true;
              productController.filterSearchResults(value);
            },
            onChanged: (value) async {
              queryStringSearch = value!;
            },
            onPressedClearButton: () {
              productController.clearSearchResults();
              focus.unfocus();
            },
          ),
        ),
        body: Observer(
          builder: (context) {
            if (productController.showResults) {
              if (MediaQuery.of(context).size.width >= 600) {
                return GridProductsPage(
                    queryStringSearch: queryStringSearch,
                    productController: productController);
              } else {
                return ListProductsPage(
                    queryStringSearch: queryStringSearch,
                    productController: productController);
              }
            } else {
              return RecentRecearch(
                  textEditingController: textEditingController,
                  productController: productController);
            }
          },
        ),
      );
    });
  }
}
