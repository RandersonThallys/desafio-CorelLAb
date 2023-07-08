import 'package:corelab_app_challenge/src/models/category_model.dart';
import 'package:corelab_app_challenge/src/models/product_model.dart';
import 'package:corelab_app_challenge/src/shared/repositories/category_repository.dart';
import 'package:corelab_app_challenge/src/shared/repositories/product_repository.dart';
import 'package:corelab_app_challenge/src/shared/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<Product> _products = [];

  @observable
  List<Category> categories = [];

  @observable
  List<Product> productsInMemory = [];

  @observable
  List<String> historyResearch = [];

  @observable
  bool inSearch = false;

  @observable
  String getInputTextSearch = '';

  @observable
  bool showResults = true;

  @observable
  bool isSelectedCategory = false;

  @observable
  List<Widget> listToday = [];

  @observable
  List<Widget> listYesterday = [];

  @observable
  List<Widget> listPreviousDay = [];

  @action
  loadProducts() async {
    isLoading = true;
    _products = ProductRepository.load();
    categories = CategoryRepository.load();
    productsInMemory = _products;
    isLoading = false;
  }

  bool isAllProducts() {
    return _products.length == productsInMemory.length;
  }

  @action
  List<Product> filterSearchResults(String query) {
    return productsInMemory = _products
        .where((item) =>
            item.description!.toLowerCase().contains(query.toLowerCase()) ||
            item.category!.toLowerCase() == (query.toLowerCase()) ||
            item.price!.toString().contains(query.toLowerCase()))
        .toList();
  }

  @action
  addListRecentResearches(String text) {
    historyResearch.insert(0, text);
  }

  @action
  clearSearchResults() {
    inSearch = false;
    showResults = true;
    productsInMemory = _products;
  }

  @action
  groupingProductsByDay() {
    listToday.clear();
    listPreviousDay.clear();
    listYesterday.clear();

    List<Widget> auxListToday = [];
    List<Widget> auxListYesterday = [];
    List<Widget> auxListPreviousday = [];

    for (var product in productsInMemory) {
      if (product.datePublication!.day == DateTime.now().day &&
          product.datePublication!.month == DateTime.now().month) {
        auxListToday.add(
          CardWidget(
            description: product.description!,
            price: product.price!,
            promotion: product.promotion!,
            imageProduct: product.imageProduct!,
          ),
        );
      } else if (product.datePublication!.day == DateTime.now().day - 1 &&
          product.datePublication!.month == DateTime.now().month) {
        auxListYesterday.add(
          CardWidget(
            description: product.description!,
            price: product.price!,
            promotion: product.promotion!,
            imageProduct: product.imageProduct!,
          ),
        );
      } else {
        auxListPreviousday.add(
          CardWidget(
            description: product.description!,
            price: product.price!,
            promotion: product.promotion!,
            imageProduct: product.imageProduct!,
          ),
        );
      }
    }

    listToday = auxListToday;
    listYesterday = auxListYesterday;
    listPreviousDay = auxListPreviousday;
  }
}
