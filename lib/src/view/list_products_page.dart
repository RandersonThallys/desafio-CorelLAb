import 'package:corelab_app_challenge/src/controller/product_controller.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:corelab_app_challenge/src/shared/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListProductsPage extends StatefulWidget {
  final ProductController productController;
  final String queryStringSearch;
  const ListProductsPage(
      {required this.queryStringSearch,
      required this.productController,
      super.key});

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
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
                          )),
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
                ...widget.productController.listToday,
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
                ...widget.productController.listYesterday,
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
                ...widget.productController.listPreviousDay,
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

  List<Widget> groupingProductsByDay() {
    return [
      Container(
        padding: (widget.productController.productsInMemory.isNotEmpty &&
                widget.productController.isAllProducts())
            ? const EdgeInsets.all(20.0)
            : null,
        child: (widget.productController.productsInMemory.isNotEmpty &&
                widget.productController.isAllProducts())
            ? Text(
                'Hoje',
                style: AppTypography().textHistoryPublication,
              )
            : Container(),
      ),
      ...widget.productController.productsInMemory.map((product) {
        if (product.datePublication!.day == DateTime.now().day &&
            product.datePublication!.month == DateTime.now().month) {
          return CardWidget(
            description: product.description!,
            price: product.price!,
            promotion: product.promotion!,
            imageProduct: product.imageProduct!,
          );
        } else {
          return Container();
        }
      }),
      Container(
        padding: (widget.productController.productsInMemory.isNotEmpty &&
                widget.productController.isAllProducts())
            ? const EdgeInsets.all(20.0)
            : null,
        child: (widget.productController.productsInMemory.isNotEmpty &&
                widget.productController.isAllProducts())
            ? Text(
                'Ontem',
                style: AppTypography().textHistoryPublication,
              )
            : Container(),
      ),
      ...widget.productController.productsInMemory.map((product) {
        if (product.datePublication!.day == DateTime.now().day - 1 &&
            product.datePublication!.month == DateTime.now().month) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardWidget(
                description: product.description!,
                price: product.price!,
                promotion: product.promotion!,
                imageProduct: product.imageProduct!,
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    ];
  }
}
