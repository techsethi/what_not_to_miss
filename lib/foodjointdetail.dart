import 'package:flutter/material.dart';
import 'package:what_not_to_miss/types/foodJoint.dart';
import 'constants.dart';

class FoodJointDetail extends StatelessWidget {
  FoodJointDetail({Key key, @required this.foodJoint})
      : assert(foodJoint != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const double height = 298.0;
  final FoodJoint foodJoint;

  Widget _topContentText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.restaurant_menu,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          foodJoint.name,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );
  }

  Widget topContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                //image: foodJoint.main_image == null ? AssetImage("images/places/goa-city.jpg") :
                //NetworkImage("$APP_HOST/${foodJoint.main_image}"),
                image: NetworkImage("https://media-cdn.tripadvisor.com/media/photo-s/0c/3d/96/5f/the-cook-in-the-background.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: _topContentText(),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget bottomContentText() {
    return Text(
      foodJoint.description,
      style: TextStyle(fontSize: 18.0),
    );
  }

  Widget readButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("Rate This Place", style: TextStyle(color: Colors.white)),
        ));
  }

  Widget bottomContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText(), readButton()],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[topContent(context), bottomContent(context)],
      ),
    );
  }
}
