import 'package:flutter/material.dart';
import 'package:food/core/store.dart';
import 'package:food/models/cart.dart';
//import 'package:food/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //can add \
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "₹${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
            //   builder: (context,_){
            //   return "₹${_cart.totalPrice}"
            //     .text
            //     .xl5
            //     .color(context.theme.colorScheme.secondary)
            //     .make(),
            // },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying is not supported yet.".text.make(),
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.highlightColor)),
                  child: "Buy".text.white.make())
              .w40(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is empty".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index])
                // _cart
                // .remove(_cart.items[index]); //to remove the selected item
                // setState(() {
                //   //rebuilds the widget to reflect changes in cart model
                // });
                ,
              ),
              title: Text(_cart.items[index].name).text.make(),
            ),
          );
  }
}
