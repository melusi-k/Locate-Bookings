import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:collection';
import 'dart:io';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Locate Bookings',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HotelListHolder(),
    );
  }
}




class HotelListHolder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyState();
  }
}

class MyState extends State<HotelListHolder> {
    List hotels;
    String impala_sandbox = "https://sandbox.impala.travel/v1/hotels?" + "size=100&offset=0&sortBy=createdAt%3Adesc";

    String key = "sandb_axEy3j9mcCVw0RyQjCxgerFAt9vJuvCyL3FUKj3v";

  @override
  Widget build(BuildContext context) {
    ListView myList = ListView.builder(
        itemCount: hotels == null ? 0 : hotels.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            leading: FlutterLogo(),
            title: Text(hotels[index]["name"]),
            subtitle: Text(hotels[index]["createdAt"].toString()),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true
          );
        }
    );

    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Locate Bookings")
        ),
        body: myList,
        drawer: new Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('@username/email'),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
      ListTile(
        title: Text('Profile'),
        onTap: () {},
      ),
      ListTile(
        title: Text('View Bookings'),
        onTap: () {},
      ),
       ListTile(
        title: Text('Settings'),
        onTap: () {},
      ),
       ListTile(
        title: Text('About us'),
        onTap: () {},
      ),
    ],
  ),
),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    Map<String, String> map = {'x-api-key':'sandb_axEy3j9mcCVw0RyQjCxgerFAt9vJuvCyL3FUKj3v', 'Access-Control-Allow-Origin':'*','Content-type':'application/json'};
    
    var uri = Uri.parse(impala_sandbox);
        
    final response = await http.get(uri,headers:{
        'Access-Control-Allow-Origin':'*',
        'Content-type':'application/json',
        'x-api-key':'sandb_axEy3j9mcCVw0RyQjCxgerFAt9vJuvCyL3FUKj3v',
        HttpHeaders.contentTypeHeader: 'application/json'
    });
    
    if(response.statusCode == 200)
    {
        Map jsonData = json.decode(response.body);
         setState(() {
         hotels = jsonData["data"];
    });
        
    } else{
        throw Exception('Failed to load Hotels');
    }
  }
}


class Hotel{
String hotelId;
String name;
String starRating;
String roomCount;
String termsAndConditions;
}






















class TestListHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<String> data = <String>["Twitter", "Reddit", "YouTube", "Facebook",
    "Vimeo", "GitHub", "GitLab", "BitBucket", "LinkedIn", "Medium",
    "Tumblr", "Instagram", "Pinterest"];

    List<RaisedButton> myWidgets = data.map((item) {
      return new RaisedButton(
          child: new Text(item),
          onPressed: () {}
      );
    }).toList();

    ListView myList = new ListView(
      children: myWidgets,
    );

    GridView myGrid = GridView.count(
        crossAxisCount: 3,
        children: myWidgets
    );

    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Locate Bookings")
        ),
        body: myGrid,
        drawer: new Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('@username/email'),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
      ListTile(
        title: Text('Profile'),
        onTap: () {},
      ),
      ListTile(
        title: Text('View Bookings'),
        onTap: () {},
      ),
       ListTile(
        title: Text('Settings'),
        onTap: () {},
      ),
       ListTile(
        title: Text('About us'),
        onTap: () {},
      ),
    ],
  ),
),
    );
  }
}
