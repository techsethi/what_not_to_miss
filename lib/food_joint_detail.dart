import 'package:flutter/material.dart';
import 'package:what_not_to_miss/types/foodJoint.dart';

class FoodJointDetail extends StatelessWidget {
  final FoodJoint foodJoint;

  FoodJointDetail({Key key, @required this.foodJoint})
      : assert(foodJoint != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(child: Text("Top Flex"))
            ),
          Expanded(
            flex: 1,
            child: Container(child: Text("Bottom")))
        ],
      )
    );
  }
}