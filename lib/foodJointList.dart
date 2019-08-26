import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:what_not_to_miss/constants.dart';
import 'package:what_not_to_miss/foodjointdetail.dart';
import 'package:what_not_to_miss/types/foodJoint.dart';
import 'dart:async';

class FoodJointList extends StatefulWidget {
  final String cityname;

  // const FoodJointList({Key key, this.cityname}) : super(key: key);

  FoodJointList(this.cityname);

  @override
  State<StatefulWidget> createState() => _FoodJointListState(this.cityname);
}

class _FoodJointListState extends State {
  Future<List<FoodJoint>> foodJoints;
  String _cityname;

  _FoodJointListState(String cityname) {
    this._cityname = cityname;
  }
  void initState() {
    super.initState();
    foodJoints = FoodJoint.browse(this._cityname);
  }

  Widget _showThumbOrIcon(_thumbnail) {
    return _thumbnail == null
        ? Icon(Icons.restaurant)
        : CircleAvatar(
            backgroundImage: NetworkImage("$APP_HOST/${_thumbnail.url}"),
            backgroundColor: Colors.transparent,
          );
  }

  Widget _listTile(FoodJoint _foodJoint) {
    return InkWell(
        child: ListTile(
            title: Text(_foodJoint.name),
            subtitle: Text(_foodJoint.description?? "-"),
            isThreeLine: true,
            trailing: Column(
              children: <Widget>[
                new Container(
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.arrowAltCircleRight),
                    onPressed: () {
                      print("pressed now");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FoodJointDetail(foodJoint: _foodJoint)));
                    },
                  ),
                )
              ],
            ),
            leading: _showThumbOrIcon(_foodJoint.thumbnail)));
  }

  Widget _myFoodJointList(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
      case ConnectionState.active:
        return Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        if (snapshot.hasError)
          return Text("There was an error : ${snapshot.error}");
        var foodJoints = snapshot.data;
        return ListView.separated(
          itemCount: foodJoints.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            FoodJoint foodJoint = foodJoints[index];
            return _listTile(foodJoint);
          },
        );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this._cityname == ''
              ? "All cities"
              : "Not to miss in ${this._cityname}"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                var _foodJoints = FoodJoint.browse(this._cityname);
                setState(() {
                  foodJoints = _foodJoints;
                });
              },
            )
          ],
        ),
        body: FutureBuilder(future: foodJoints, builder: _myFoodJointList));
  }
}
