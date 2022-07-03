import 'package:flutter/material.dart';
import 'package:gro_app_ui/model/buy_item_model.dart';
import 'package:gro_app_ui/widgets/collect_items.dart';
import 'package:gro_app_ui/widgets/item_widget.dart';

class CartScreen extends StatefulWidget {
  final List<BuyItem>? items;

  const CartScreen({Key? key, this.items}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [dataContent(widget.items)],
      )),
    );
  }

  SliverList dataContent(List<BuyItem>? items) {
    return SliverList(delegate: sliverChildBuilderDelegate(items));
  }

  SliverChildBuilderDelegate sliverChildBuilderDelegate(List<BuyItem>? items) {
    List<Widget> widgets = [];
    for (var i in CollectItem.collectItems) {
      widgets.add(ItemWidget(
        buyItem: i,
        isInChart: true,
        deleteFunction: (){
          setState((){
            CollectItem.collectItems.remove(i);
          });
        },
      ));
    }
    return SliverChildBuilderDelegate((context, index) {
      return widgets[index];
    }, childCount: widgets.length);
  }
}
