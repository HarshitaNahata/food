import 'package:food/models/desidelight.dart';

class CartModel {
  //Singleton class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  //desidelight field
  desiDelightModel _desidelight = new desiDelightModel();

  //collection of ids to store ID of each item
  final List<int> _itemIds = [];

  //get desidelight
  desiDelightModel get desidelight => _desidelight;

  set desidelight(desiDelightModel newDesidelight) {
    assert(newDesidelight != null);
    _desidelight = newDesidelight;
  }

  //Get items in the cart
  List get items => _itemIds.map((id) => _desidelight.getById(id)).toList();

  //Get total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
