// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce_app/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int discountValue;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue = 0,
    this.category = "Other",
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
  Product(
    id: "1",
    title: "T-Shirt",
    price: 300,
    imgUrl: AppAssets.temProductPageAsset1,
    category: "Clothes",
  ),
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imgUrl: AppAssets.temProductPageAsset1,
      category: "Clothes",
      discountValue: 20),
];
