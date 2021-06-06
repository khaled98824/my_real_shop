import 'package:flutter/material.dart';

import 'app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Order Screen'),
      ),
      body: Container(
          child: Center(
        child: Text(
          'Order Item1',
        ),
      )),
    );
  }
}
