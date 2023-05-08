import 'package:flutter/material.dart';
import 'package:travelled_app/model/travel_model.dart';

class DetailScreen extends StatelessWidget {
  final Travel travel;
  final double expandedHieht = 300;
  final double roundedContainerHeight = 50;
  DetailScreen({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSilverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                right: 15,
                left: 15,
              ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSilverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        travel: travel,
        expandedHieht: expandedHieht,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }
  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sagittis risus tortor, sed rutrum lorem luctus eu. Nullam sed lorem eu nisi gravida tincidunt id quis purus. Etiam libero enim, fringilla non euismod id, ultrices quis urna. Sed quis facilisis elit, nec lacinia neque. Quisque pretium vel tellus eu feugiat. Maecenas facilisis ut est sed pulvinar. Etiam finibus enim mi, sit amet pulvinar tellus vehicula volutpat. Nam non augue sapien. Suspendisse lacinia porta arcu et volutpat. Aliquam et porta libero. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In sodales enim ut vehicula commodo.',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 160,
            child: FeaturedWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sagittis risus tortor, sed rutrum lorem luctus eu. Nullam sed lorem eu nisi gravida tincidunt id quis purus. Etiam libero enim, fringilla non euismod id, ultrices quis urna. Sed quis facilisis elit, nec lacinia neque. Quisque pretium vel tellus eu feugiat. Maecenas facilisis ut est sed pulvinar. Etiam finibus enim mi, sit amet pulvinar tellus vehicula volutpat. Nam non augue sapien. Suspendisse lacinia porta arcu et volutpat. Aliquam et porta libero. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In sodales enim ut vehicula commodo.',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildUserInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              travel.url,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  travel.location,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(Icons.share),
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHieht;
  final double roundedContainerHeight;

  DetailSliverDelegate({
    required this.travel,
    required this.expandedHieht,
    required this.roundedContainerHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: expandedHieht,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: expandedHieht - roundedContainerHeight - shrinkOffset,
            left: 0,
            child: Container(
              height: roundedContainerHeight,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
        ),
        Positioned(
            top: expandedHieht - shrinkOffset - 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    travel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                    travel.location,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHieht;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FeaturedWidget extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
        var travel = _list[index];
          return Container(
            width: 120,
            child: Image.asset(
                travel.url,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(width: 10,),
        itemCount: _list.length,
    );
  }
}
