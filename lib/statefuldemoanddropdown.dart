import 'package:flutter/material.dart';

void main () {
  runApp(MaterialApp(
    title: "stateful app eg",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  _FavoriteCityState createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity ="";
  var _curriencies = ['Rupees','Dollar','Pound','others'];
  var _currentItemSelected = 'Rupees';
  @override
  Widget build(BuildContext context) {
    debugPrint("favroit city widget is created");
    return Scaffold(
      appBar: AppBar(
        title: Text("statefull ap eg"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput){
                setState(() {
                  debugPrint("set state is called this tells framework to redraw favcity widget");
                  nameCity = userInput;

                });


              },
            ),

            DropdownButton<String>(
              items: _curriencies.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected){
                //your code to execute when a item is selected from dropdown
                _dropDownItemSelected(newValueSelected);

              },
              value: _currentItemSelected,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "ÿour best city is $nameCity",
                style: TextStyle(fontSize: 20.0),
              ),)
          ],
        ),
      ),
    );
  }
  void _dropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
