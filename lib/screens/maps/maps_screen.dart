import 'package:flutter/material.dart';
import '../components/header.dart';

import '../../constants.dart';

class MapsScreen extends StatefulWidget 
{
  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> 
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [

            Header("Maps"),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text('hello'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}