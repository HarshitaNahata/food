import 'package:flutter/material.dart';
import 'package:food/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class desiDelightHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "DesiDelights"
            .text
            .xl5
            .bold
            .color(context.theme.colorScheme.secondary)
            .make(),
        "Yummy Delights".text.xl.make(),
      ],
    );
  }
}
