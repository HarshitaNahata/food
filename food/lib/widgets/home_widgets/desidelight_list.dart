// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:food/models/cart.dart';
import 'package:food/models/desidelight.dart';
import 'package:food/pages/home_detail_page.dart';
//import 'package:food/pages/home_page.dart';
import 'package:food/widgets/home_widgets/add_to_cart.dart';
import 'package:food/widgets/home_widgets/desidelight_image.dart';
//import 'package:food/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

class desiDelightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: desiDelightModel.items.length,
      itemBuilder: (context, index) {
        final desidelight = desiDelightModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(desidelight: desidelight),
            ),
          ),
          child: desiDelightItem(desidelight: desidelight),
        );
      },
    );
  }
}

class desiDelightItem extends StatelessWidget {
  final Item desidelight;

  const desiDelightItem({Key? key, required this.desidelight})
      : assert(desidelight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(desidelight.id.toString()),
            child: desiDelightImage(
              image: desidelight.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              desidelight.name.text.lg
                  .color(context.theme.colorScheme.secondary)
                  .bold
                  .make(),
              desidelight.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "₹${desidelight.price}".text.bold.xl.make(),
                  AddToCart(desidelight: desidelight)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

