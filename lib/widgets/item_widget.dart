import 'package:flutter/material.dart';
import 'package:gro_app_ui/model/buy_item_model.dart';

class ItemWidget extends StatelessWidget {
  final BuyItem buyItem;
  final VoidCallback? function;
  final VoidCallback? deleteFunction;
  final bool isInChart;

  const ItemWidget({
    Key? key,
    this.function,
    required this.buyItem,
    this.deleteFunction, required this.isInChart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(buyItem.imageUrl),
            )),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.green,
                    ),
                    onPressed: function,
                  ),
                )),
          ),
          isInChart?Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove_shopping_cart,
                      color: Colors.red,
                    ),
                    onPressed: deleteFunction,
                  ),
                )),
          ):Container(),
        ]),
      ),
    );
  }
}
