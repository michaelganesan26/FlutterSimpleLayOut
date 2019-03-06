import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  bool _upFlag = false;

  void _toggleFavorite() {
    setState(() {
      //  if(_isFavorited){
      //    _favoriteCount -=1;
      //    _isFavorited = false;
      //  } else {
      //    _favoriteCount +=1;
      //    _isFavorited = true;
      //  }
      if (_favoriteCount >= 99) {
        _upFlag = false;
      } else {
        if (_favoriteCount == 0) {
          _favoriteCount = 0;
          _upFlag = true;
          _isFavorited = true;
        }
      }
      if (_upFlag) {
        _favoriteCount += 1;
      } else {
        _favoriteCount -= 1;
      }

      _isFavorited = !_isFavorited;
    });
  }

// toggle button for ascending and descending
  void _toggleUpDownFlag() {
    setState(() {
      _upFlag = !_upFlag;
    });
  }

  void _resetFavoriteCount() {
    setState(() {
      _upFlag = true;
      _favoriteCount = 0;
      _isFavorited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (Icon(Icons.delete)),
            color: Colors.indigo[800],
            onPressed: _resetFavoriteCount,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_upFlag
                ? Icon(Icons.radio_button_checked)
                : Icon(Icons.radio_button_unchecked)),
            color: Colors.amber[600],
            onPressed: _toggleUpDownFlag,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_upFlag ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        SizedBox(
            width: 18,
            child: Container(
              child: Text('$_favoriteCount'),
            )),
      ],
    );
  }
}

//Statefull Widget
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _MGFloatingButtonState extends State<MGFloatingButton>{
   bool _dataflag =false;

   void _togglePressed(){

      setState(() {
        _dataflag = !_dataflag;
      });

   }

   Widget build(BuildContext context){

      return FloatingActionButton(
        child: Icon(_dataflag?Icons.android:Icons.check_circle),
        onPressed: _togglePressed,);
   }

}



//Stateful Floating Button Widget
class MGFloatingButton extends StatefulWidget {

  @override
  _MGFloatingButtonState createState() => _MGFloatingButtonState();



}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        /*
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',*/
        'Image of Chen the brew master from World of War Craft',
        softWrap: true,
      ),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget imageSection = Container(
        child: new AspectRatio(
            aspectRatio: 487 / 451,
            child: new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image: AssetImage('images/chen.jpg'))))));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chen Image',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Michael\'s Chen Image'),
            ),
            body: ListView(
              children: <Widget>[
                imageSection,
                titleSection,
                buttonSection,
                textSection,
                new MGFloatingButton(),
              ],
            )));
  }
}
