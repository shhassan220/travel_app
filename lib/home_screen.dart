import 'package:flutter/material.dart';
import 'package:travelled_app/widgets/most_popular.dart';
import 'package:travelled_app/widgets/travel_blog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
                Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
            child: Text(
                "Travel Blog",
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ),
          Expanded(
              flex: 2,
            child: TravelBlog(),
          ),
          Padding(
              padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Popular",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 16,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,child: MostPopular(),
          ),
        ],
      ),
    );
  }
}
