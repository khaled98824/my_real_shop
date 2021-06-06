// @dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_shop/providers/products.dart';
import 'package:real_shop/screens/edit_product.dart';

import 'app_drawer.dart';

class UserProductItem extends StatelessWidget {
  static const routeName = '/user-product-item';
  final String id;
  final String title;
  final String imageUrl;

  const UserProductItem([this.id, this.title, this.imageUrl]);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return  ListTile(
          title: Text(title),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Navigator.of(context).pushNamed(
                    EditProductScreen.routeName,
                    arguments: id,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    try {
                      await Provider.of<Products>(context, listen: false)
                          .deleteProduct(id);
                    } catch (e) {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text(
                            'Delete faild',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                  color: Theme.of(context).errorColor,
                )
              ],
            ),
          ),
        );
  }
}
