import 'package:corelab_app_challenge/src/models/product_model.dart';

final products = [
  Product(
      description: "Sabonete Líquido Facial Glycare com 120ml",
      price: 29.99,
      category: "Dermocosméticos",
      promotion: 0.1,
      imageProduct: 'assets/images/glycare.jpg',
      datePublication: DateTime.parse('2023-07-07')),
  Product(
      description: "Protetor Solar Profuse Ensolei Toque Seco FPS 70",
      price: 75.99,
      category: "Dermocosméticos",
      promotion: 0.0,
      imageProduct: 'assets/images/protetor_ensolei_70.jpg',
      datePublication: DateTime.tryParse('2023-07-06')),
  Product(
      description: "Gel para Cicatriz Contractubex 20g",
      price: 45.99,
      category: "Medicamentos",
      promotion: 0.25,
      imageProduct: 'assets/images/gel_contractubex.jpg',
      datePublication: DateTime.tryParse('2023-07-06')),
  Product(
      description: "Colírio Adaptis Gel 0,2% com 10g",
      price: 32.59,
      category: "Medicamentos",
      promotion: 0.05,
      imageProduct: 'assets/images/colirio_adaptis.jpg',
      datePublication: DateTime.tryParse('2023-07-07')),
  Product(
      description: "Barra de proteínas Pro30Vit Chocolate",
      price: 12.99,
      category: "Vitaminas e suplementos",
      promotion: 0.15,
      imageProduct: 'assets/images/barra_chocolate_pro30vit.jpg',
      datePublication: DateTime.tryParse('2023-07-06')),
  Product(
      description: "Suplemento Alimentar Woman - 60 Comprimidos",
      price: 129.99,
      category: "Vitaminas e suplementos",
      promotion: 0.0,
      imageProduct: 'assets/images/suplmento_alimentar_woman.jpg',
      datePublication: DateTime.tryParse('2023-07-07')),
  Product(
      description: "Neosaldina (Hypera Pharma)",
      price: 145.99,
      category: "Medicamentos",
      promotion: 0.5,
      imageProduct: 'assets/images/suplmento_alimentar_woman.jpg',
      datePublication: DateTime.tryParse('2023-04-07')),
  Product(
      description: "Creatina 200g",
      price: 159.99,
      category: "Vitaminas e suplementos",
      promotion: 0.17,
      imageProduct: 'assets/images/suplmento_alimentar_woman.jpg',
      datePublication: DateTime.tryParse('2023-07-07')),
  Product(
      description: "Espuma de limpeza",
      price: 129.99,
      category: "Dermocosméticos",
      promotion: 0.0,
      imageProduct: 'assets/images/gel_contractubex.jpg',
      datePublication: DateTime.tryParse('2023-07-07')),
  Product(
      description: "Whey Protein",
      price: 129.99,
      category: "Vitaminas e suplementos",
      promotion: 0.27,
      imageProduct: 'assets/images/suplmento_alimentar_woman.jpg',
      datePublication: DateTime.tryParse('2023-03-07')),
];
