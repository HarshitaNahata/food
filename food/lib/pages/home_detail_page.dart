import 'package:flutter/material.dart';
import 'package:food/models/desidelight.dart';
import 'package:food/widgets/home_widgets/add_to_cart.dart';
import 'package:food/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item desidelight;

  const HomeDetailPage({Key? key, required this.desidelight})
      : assert(desidelight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "₹${desidelight.price}".text.bold.xl4.green500.make(),
            AddToCart(
              desidelight: desidelight,
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(desidelight.id.toString()),
              child: Image.network(desidelight.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    desidelight.name.text.xl3
                        .color(context.theme.colorScheme.secondary)
                        .bold
                        .make(),
                    desidelight.desc.text
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    10.heightBox,
                    "We no said yore rare it of oer there yet flown, of here upon still kind, nepenthe some of burden when, rare quoth opened still lattice wished. And nothing quoth spoken me of, bleak plutonian door still these from, on raven its hope at beguiling air from ah, of not."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
