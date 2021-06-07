// @dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatefulWidget {
  static const routeName = '/order-screen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future: Provider.of<Orders>(context, listen: false)
              .fetchAndSetOrders(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapShot.error != null) {
                return Center(child: Text('Error'),);
              } else {
                 return Consumer<Orders>(
                  builder: (ctx, orderData, child) =>
                      ListView.builder(
                        itemCount: orderData.orders.length,
                        itemBuilder: (context, index) =>OrderItem(orderData.orders[index]),),

                );
              }
            }

          }),
    );
  }
}
