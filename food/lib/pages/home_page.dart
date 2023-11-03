import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/core/store.dart';
import 'package:food/models/cart.dart';
import 'dart:convert'; //helps to encode and decode
import 'package:food/models/desidelight.dart';
import 'package:food/utils/routes.dart';
import 'package:food/widgets/home_widgets/desidelight_header.dart';
import 'package:food/widgets/home_widgets/desidelight_list.dart';
// import 'package:food/widgets/drawer.dart';
// import 'package:food/widgets/item_widget.dart';
import 'package:food/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:food/widgets/item_widget.dart';

//basic changes of css are made because of material.dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int cost = 30;

  final String name = "Golgappe";
  @override
  void initState() {
    // before the build method is called ,you get the data
    super.initState();
    loadData();
  }

  loadData() async {
    final desiDelightJson =
        await rootBundle.loadString("assets/files/desidelight.json");
    final decodedData = jsonDecode(desiDelightJson);
    var productsData = decodedData["products"]; //to map the products
    // print(desiDelightJson);
    desiDelightModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList(); //only 1 item would be visible so now to take data from json and reload it we have to set state
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => desiDelightModel.items[0]);
    //widget always has return types and has paremeters in it like int cost, bool packet and if needed you can give @requiredwhich means you have to specify whether its true or false while calling a method
    //build is already a built function which is being over-ridden and widget gets built like a tree
    //var desiDelightModel;
    // desiDelightModel desiDelight = desiDelightModel();
    return Scaffold(
        backgroundColor: context.canvasColor, //Theme.of(context).cardColor
        floatingActionButton: VxBuilder(
          builder: (context, store, status_) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.highlightColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.yellow500,
              size: 22,
              count: _cart.items.length,
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          mutations: {AddMutation, RemoveMutation},
        ),
        //scaffold has many components,context tells us the location
        // appBar: AppBar(
        //   title: Text("DesiDelights"),
        // ), //acts like the header of page
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                desiDelightHeader(),
                if (desiDelightModel.items != null &&
                    desiDelightModel.items.isNotEmpty)
                  desiDelightList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (desiDelightModel.items != null &&
        //           desiDelightModel.items.isNotEmpty)
        //       ? GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             crossAxisSpacing: 16, //horizontal spacing
        //             mainAxisSpacing: 16, //vertical spacing
        //           ), //grid delegate tells us how many items we can have in a row and cross axis count is how many items you can place in row
        //           itemBuilder: (context, index) {
        //             final item = desiDelightModel.items[index];
        //             return Card(
        //                 clipBehavior: Clip.antiAlias,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(10)),
        //                 child: GridTile(
        //                   header: Container(
        //                     child: Text(
        //                       item.name,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.orange,
        //                     ),
        //                   ),
        //                   child: Image.network(
        //                     item.image,
        //                   ),
        //                   footer: Container(
        //                     child: Text(
        //                       item.price.toString(),
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.black,
        //                     ),
        //                   ),
        //                 ));
        //           },
        //           itemCount: desiDelightModel.items.length,
        //         )
        //       // ListView.builder(
        //       //     itemCount: desiDelightModel.items.length,
        //       //     itemBuilder: (context, index) => ItemWidget(
        //       //         key: Key('item${index}'),
        //       //         item: desiDelightModel.items[index]),
        //       //   )
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ), //builder does the work that whatevr is visible on screen only that should be rendered
        // drawer:
        //     MyDrawer(), //you can see a small menu button,same name as property ,bottom navigation bar acts as footer
        );
  }
}
