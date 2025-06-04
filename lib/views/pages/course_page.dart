import 'package:flutter/material.dart';
import 'package:flutter_app/data/classes/activity_class.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  @override 
    void initState() {
      getData();
      super.initState();
    // You can initialize any data or state here if needed
  }

  Future getData() async {
    var url =
      Uri.https('bored-api.appbrewery.com', '/random');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Activity.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
       future: getData(),
       builder: (context, AsyncSnapshot snapshot) {
      
    Widget widget;

  if (snapshot.connectionState == ConnectionState.waiting) {
    widget = Center(child: CircularProgressIndicator());
  } else if (snapshot.hasData) {
    Activity activity = snapshot.data;
    widget = Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [      
            ...List.generate(2, (index) => ContainerWidget(title: activity.activity)),
            Text("Type: ${activity.type}"),
            Text("Participants: ${activity.participants}"),
            Text("Price: ${activity.price}"),
            Text("Accessibility: ${activity.accessibility}"),
          ],
        ),
      ),
    );
  } else {
    widget = Center(child: Text("Error loading data"));
  }

  return widget; // ✅ Only one return statement
},
      )
    );
  }
}