import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/cart.dart';
import 'package:food/models/desidelight.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item desidelight;
  AddToCart({
    Key? key,
    required this.desidelight,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(desidelight) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _desidelight = desiDelightModel();
          _cart.desidelight = _desidelight;
          _cart.add(desidelight);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.theme.highlightColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
