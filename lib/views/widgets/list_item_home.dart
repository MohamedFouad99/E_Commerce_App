// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                ),
              ),
              product.discountValue != 0
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: 50,
                        height: 30,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '-${product.discountValue}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            product.category,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text.rich(
            TextSpan(children: [
              product.discountValue != 0
                  ? TextSpan(
                      text: '${product.price}\$',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                    )
                  : TextSpan(),
              product.discountValue != 0
                  ? TextSpan(
                      text:
                          ' ${(product.price * product.discountValue / 100) - product.price}\$',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.grey),
                    )
                  : TextSpan(
                      text: '${product.price}\$',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.grey,
                          )),
            ]),
          ),
        ],
      ),
    );
  }
}
