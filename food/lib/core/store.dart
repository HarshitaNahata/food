import 'package:food/models/cart.dart';
import 'package:food/models/desidelight.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  desiDelightModel desidelight = new desiDelightModel();
  CartModel cart = new CartModel();

  MyStore() {
    desidelight = desiDelightModel();
    cart = CartModel();
    cart.desidelight = desidelight;
  }
}
