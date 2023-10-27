import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/cart.dart';
import 'package:food/models/desidelight.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item desidelight;
  const AddToCart({
    Key? key,
    required this.desidelight,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.desidelight) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _desidelight = desiDelightModel();
          _cart.desidelight = _desidelight;
          _cart.add(widget.desidelight);
          setState(() {});
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
