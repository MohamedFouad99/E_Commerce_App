// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element

import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/utilities/assets.dart';
import 'package:e_commerce_app/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildHeaderOfList(BuildContext context,
      {required String title,
      VoidCallback? onTap,
      required String description}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
        InkWell(
          onTap: onTap,
          child: Text('View All', style: Theme.of(context).textTheme.subtitle1),
        )
      ]),
      Text(
        description,
        style:
            Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Placeholder(
                  fallbackHeight: MediaQuery.of(context).size.height * 0.3,
                  fallbackWidth: double.infinity),
              Image.network(
                AppAssets.topBannerHomePageAsset,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                child: Text(
                  "Street Clothes",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildHeaderOfList(context,
                    title: "Sale", description: "Super Summer Sale"),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 265,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: dummyProducts
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListItemHome(product: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                _buildHeaderOfList(context,
                    title: "New", description: "Super New Product"),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 265,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: dummyProducts
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListItemHome(product: e),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
