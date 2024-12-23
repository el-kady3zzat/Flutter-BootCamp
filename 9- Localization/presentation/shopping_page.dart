import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/core/widgets/product_card.dart';
import 'package:first_flutter_project/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late BuildContext cntxt;

  @override
  Widget build(BuildContext context) {
    cntxt = context;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'shopping_page'.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          _productsPageView(),
          _space(2),
          _productsGridView(),
          _space(1),
          _hotOffers(),
        ],
      ),
    );
  }

  Widget _productsPageView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _space(1),
        Text('our_products'.tr(),
            style: Theme.of(cntxt).textTheme.displayMedium),
        _space(1),
        Container(
          width: double.infinity,
          height: SizeConfig.defaultSize! * 20,
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[500],
          ),
          child: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Image.asset(
                productsList[index].imgs[0],
                width: SizeConfig.defaultSize! * 15,
                height: SizeConfig.defaultSize! * 15,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _productsGridView() {
    List<Product> products = productsList;

    return Container(
      width: double.infinity,
      height: 287,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[900],
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _orientation() ? 2 : 4,
          childAspectRatio: 0.735,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(product: products[index]),
      ),
    );
  }

  Widget _hotOffers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _space(1),
        Text('hot_offers'.tr(), style: Theme.of(cntxt).textTheme.displayMedium),
        _space(1),
        Container(
          width: double.infinity,
          height: SizeConfig.defaultSize! * 20,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[500],
          ),
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: SizeConfig.defaultSize! * 14,
                  margin: const EdgeInsets.only(right: 10),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.asset(
                            productsList[index].imgs[0],
                            width: SizeConfig.defaultSize! * 8,
                            height: SizeConfig.defaultSize! * 1,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              productsList[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _space(double space) {
    return SizedBox(height: SizeConfig.defaultSize! * space);
  }

  List<Product> productsList = [
    Product(
      id: '1',
      title: 'IPhone 16 Pro',
      price: 50000,
      stock: 6,
      rate: 4.3,
      hasSale: true,
      salePercent: '10',
      salePrice: 45000,
      imgs: ['assets/images/iPhone_16_Pro.png'],
    ),
    Product(
      id: '2',
      title: 'Samsung Galaxy S24 Ultra',
      price: 45999,
      stock: 11,
      rate: 4.8,
      hasSale: false,
      salePercent: '0',
      salePrice: 0,
      imgs: ['assets/images/S24_Ultra.png'],
    ),
    Product(
      id: '3',
      title: 'Honor X9B 5G',
      price: 24500,
      stock: 11,
      rate: 5.0,
      hasSale: false,
      salePercent: '0',
      salePrice: 0,
      imgs: ['assets/images/honor_x9b.png'],
    ),
    Product(
      id: '4',
      title: 'IPhone',
      price: 10,
      stock: 9,
      rate: 0,
      hasSale: false,
      salePercent: '0',
      salePrice: 0,
      imgs: ['assets/images/iPhone_16_Pro.png'],
    ),
    Product(
      id: '5',
      title: 'IPhone',
      price: 10,
      stock: 11,
      rate: 0,
      hasSale: false,
      salePercent: '0',
      salePrice: 0,
      imgs: ['assets/images/iPhone_16_Pro.png'],
    ),
  ];

  bool _orientation() {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
