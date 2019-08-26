import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:geolocator/geolocator.dart';
import 'package:what_not_to_miss/foodJointList.dart';
import 'types/travel_destination.dart';

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const double height = 298.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodJointList(destination.city),
                      ),
                    );
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: TravelDestinationContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({Key key, @required this.destination})
      : assert(destination != null),
        super(key: key);

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline
        .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    final List<Widget> children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 184.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              // In order to have the ink splash appear above the image, you
              // must use Ink.image. This allows the image to be painted as part
              // of the Material and display ink effects above it. Using a
              // standard Image will obscure the ink splash.
              child: Ink.image(
                image: AssetImage(destination.assetName),
                fit: BoxFit.cover,
                child: Container(),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 16.0,
              right: 16.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  destination.city,
                  style: titleStyle,
                ),
              ),
            ),
          ],
        ),
      ),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  destination.title,
                  style: descriptionStyle.copyWith(color: Colors.black54),
                ),
              ),
              Text("${destination.city} - ${destination.title}"),
            ],
          ),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String selectedCity;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("What Not to Miss: Select City"),
          automaticallyImplyLeading: false),
      body: Container(
          child: Center(
              child: ListView(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        children: destinations.map((TravelDestination destination) {
          Widget child;

          child =
              TravelDestinationItem(destination: destination, shape: _shape());
          return Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: child,
          );
        }).toList(),
      ))),
    );
  }

  Widget _locationForm() {
    return Card(
      child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 10.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  new TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter name of city you want to search',
                          icon: new Icon(FontAwesomeIcons.city)),
                      onSaved: (val) => _saveData(val)),
                  new RaisedButton(
                    onPressed: _submitButton,
                    color: Colors.blue,
                    child: Text(
                      "Find what not to miss",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  new RaisedButton(
                    onPressed: _useCurrentLocation,
                    color: Colors.green,
                    child: Text(
                      "Use my CUrrent Location",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ))),
    );
  }

  _shape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(2.0),
        bottomRight: Radius.circular(2.0),
      ),
    );
  }

  void _saveData(val) {
    setState(() {
      this.selectedCity = val;
    });
  }

  void _submitButton() {
    final form = formKey.currentState;
    form.save();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => FoodJointList(this.selectedCity),
      ),
    );
  }

  Future _useCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            FoodJointList(this.selectedCity ?? ""),
      ),
    );
  }
}
