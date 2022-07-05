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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/banner_image.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/bread.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/drinks.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/meal.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/milk.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('assets/images/olives.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),

          ),
        ),
      ),

      Image.asset("assets/images/search.png"),




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
                  children: const [
                    Text(
                      "Find Products",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                SearchBarWidget(),

                const SizedBox(height: 20,),

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
