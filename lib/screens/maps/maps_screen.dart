import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:admin/models/TaskModel.dart';

class MapsScreen extends StatefulWidget 
{
  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getMap()
      ),
    );
  }

  Widget getMap()
  {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(1.3521, 103.8198);

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(1.3521, 103.8198);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      TaskModel.demoTasks.forEach((element) {
        // Marker(MarkerOptions()
        //   ..position = myLatlng
        //   ..map = map
        //   ..title = element.title
        // );

        print(element.location);
      });

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}