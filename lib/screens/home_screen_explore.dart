import 'package:flutter/material.dart';
import 'package:gro_app_ui/widgets/search_bar_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {


    List<Widget> CategoryProduct = [
      Image.asset("assets/images/banner_image.png"),
      Image.asset("assets/images/bread.png"),
      Image.asset("assets/images/drinks.png"),
      Image.asset("assets/images/meal.png"),
      Image.asset("assets/images/milk.png"),
      Image.asset("assets/images/olives.png"),
      Image.asset("assets/images/sebzemeyve.jpg"),
      Image.asset("assets/images/sebzemeyve.jpg"),



    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Find Products",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                SearchBarWidget(),

                SizedBox(height: 20,),

                SizedBox(height: MediaQuery.of(context).size.height,
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return CategoryProduct[index];
                          },
                          childCount: CategoryProduct.length,
                        ),
                      ),
                    ],
                  ),
                )





              ],
            ),
          ),
        ),
      ),
    );
  }
}
