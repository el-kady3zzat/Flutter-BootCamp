import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.blue[500],
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _img(),
                    _space(.7),
                    _rate(),
                    _space(.7),
                    _name(),
                    _space(.7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _price(),
                        _addToCartBtn(context),
                      ],
                    ),
                    _space(.7),
                  ],
                ),
              ),
              _stock(),
            ],
          ),
        ),
        //
        if (product.hasSale) _sale(),
      ],
    );
  }

  Widget _sale() {
    return Container(
      height: 30,
      width: 60,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: Text(
          '${product.salePercent}%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _img() {
    return Center(
      child: Image.asset(product.imgs[0], height: SizeConfig.defaultSize! * 11),
    );
  }

  Widget _rate() {
    return Container(
      height: 30,
      width: 65,
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star_rounded, color: Colors.blue[500]),
          //
          Text(
            double.parse(product.rate.toStringAsFixed(1)).toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          //
        ],
      ),
    );
  }

  Widget _name() {
    return Text(
      product.title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  Widget _price() {
    return Column(
      children: [
        Text(
          '\$ ${product.price.toInt()}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: product.hasSale == true ? 16 : 20,
            color: product.hasSale == true ? Colors.orange : Colors.white,
            decoration:
                product.hasSale == true ? TextDecoration.lineThrough : null,
          ),
        ),
        //
        product.hasSale == true
            ? Text(
                '\$ ${product.salePrice.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _addToCartBtn(context) {
    return GestureDetector(
      onTap: () {
        addToCart(context);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: const BorderRadius.all(Radius.circular(60)),
        ),
        child: const Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  void addToCart(context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item added to the cart',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.done_rounded,
                color: Colors.white,
              )
            ],
          ),
          backgroundColor: Colors.blue[900],
          duration: const Duration(seconds: 3),
        ),
      );
  }

  Widget _stock() {
    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: product.stock < 11.0 ? Colors.orange : Colors.green,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          product.stock < 11.0 ? 'Out of stock soon' : 'In stock',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _space(double space) {
    return SizedBox(height: SizeConfig.defaultSize! * space);
  }
}
