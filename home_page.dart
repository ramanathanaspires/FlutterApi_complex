import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
  }

class HomePageState extends State<HomePage> {
  String url = 'https://randomuser.me/api/?results=50';
  List data;
  
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url), 
    headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
        var extractData = json.decode(response.body);
        data =extractData['results'];
        // print(data[0]['name']['first']);
    });
 
  }
@override
void initState()
{
  this.makeRequest();
}

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contact List"),
      ),
           body: new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, i) {
                print(data[i]["phone"]);
                return new ListTile(
                  title: new Text(data[i]["name"]["first"]),           
                  subtitle: new Text(data[i]["phone"]),
                  leading: CircleAvatar(
                    backgroundImage: new NetworkImage(data[i]["picture"]['thumbnail']),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => SecondPage(data[i]
                      )));
                  },
                );
              },
            )
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage(this.data);
  final data;
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text("Profile Image"),
    ),
    body: new Center (
      
      // child: new Container(
      //   width: 300,
      //   height: 300,
      //   decoration: new BoxDecoration(
      //     color: Colors.teal,
      //     image: new DecorationImage(
      //       image: new NetworkImage(data["picture"]["large"]),
      //       fit: BoxFit.fill
      //     ),
      //     border: new Border.all(
            
      //         style: BorderStyle.solid,
      //         color: Colors.green,
      //         width: 5.0,
      //       ),
            
          
      //     borderRadius: BorderRadius.all(Radius.circular(100.0))
          
          
      //   ),
      // )
    ),
  );
}