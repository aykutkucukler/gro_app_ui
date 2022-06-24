import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchIcon = "assets/images/search.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(searchIcon),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "search store",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7C7C7C)),
          ),

        ],
      ),
    );
  }
}
