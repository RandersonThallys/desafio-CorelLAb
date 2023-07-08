import 'package:corelab_app_challenge/src/controller/product_controller.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GridProductsPage extends StatefulWidget {
  final ProductController productController;
  final String queryStringSearch;
  const GridProductsPage(
      {required this.queryStringSearch,
      required this.productController,
      super.key});

  @override
  State<GridProductsPage> createState() => _GridProductsPageState();
}

class _GridProductsPageState extends State<GridProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.sizeOf(context).height;

    return Observer(
      builder: (_) {
        widget.productController.groupingProductsByDay();
        if (widget.productController.productsInMemory.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: widget.productController.isAllProducts()
                      ? Text(
                          'Últimos anúncios',
                          style: AppTypography().textTitleAndPrice,
                        )
                      : Text(
                          '${widget.productController.productsInMemory.length} resultados encontrados',
                          style: AppTypography().textQuantityResult,
                        ),
                ),
                if (widget.productController.listToday.isNotEmpty)
                  Container(
                    padding:
                        (widget.productController.productsInMemory.isNotEmpty &&
                                widget.productController.isAllProducts())
                            ? const EdgeInsets.all(20.0)
                            : null,
                    child:
                        (widget.productController.productsInMemory.isNotEmpty &&
                                widget.productController.isAllProducts())
                            ? Text(
                                'Hoje',
                                style: AppTypography().textHistoryPublication,
                              )
                            : Container(),
                  ),
                GridView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                    ),
                    children: widget.productController.listToday),
                if (widget.productController.listYesterday.isNotEmpty)
                  Container(
                    padding:
                        (widget.productController.productsInMemory.isNotEmpty &&
                                widget.productController.isAllProducts())
                            ? const EdgeInsets.all(20.0)
                            : null,
                    child:
                        (widget.productController.productsInMemory.isNotEmpty &&
                                widget.productController.isAllProducts())
                            ? Text(
                                'Ontem',
                                style: AppTypography().textHistoryPublication,
                              )
                            : Container(),
                  ),
                GridView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                    ),
                    children: widget.productController.listYesterday),
                if (widget.productController.listPreviousDay.isNotEmpty)
                  Container(
                    padding:
                        (widget.productController.productsInMemory.isNotEmpty &&
                                widget.productController.isAllProducts())
                            ? const EdgeInsets.all(20.0)
                            : null,
                    child:
                        (widget.productController.productsInMemory.isNotEmpty &&
                                widget.productController.isAllProducts())
                            ? Text(
                                'Mais antigos',
                                style: AppTypography().textHistoryPublication,
                              )
                            : Container(),
                  ),
                GridView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                    ),
                    children: widget.productController.listPreviousDay),
              ],
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/rafiki_notfound.png'),
                SizedBox(
                  height: heightSize * 0.04,
                  child: Text(
                    'Resultado não encontrado',
                    style: AppTypography().textTitleAndPrice,
                  ),
                ),
                Text(
                  'Não encontramos nenhum resultado parecido com "${widget.queryStringSearch}"',
                  textAlign: TextAlign.center,
                  style: AppTypography().textHintSearchBar,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
