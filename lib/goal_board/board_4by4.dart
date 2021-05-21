import 'package:flutter/material.dart';

class BoardOf4x4 extends StatefulWidget {
  @override
  _BoardOf4x4State createState() => _BoardOf4x4State();
}

class _BoardOf4x4State extends State<BoardOf4x4> {
  var border = BorderSide(
    width: 1,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            oneRoomContainer(50, 50, Colors.orange),
            oneRoomContainer(50, 50, Colors.orange),
            oneRoomContainer(50, 50, Colors.green),
            oneRoomContainer(50, 50, Colors.green)
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                oneRoomContainer(50, 50, Colors.orange),
                oneRoomContainer(50, 50, Colors.indigo),
              ],
            ),
            // oneRoomContainer(100, 100, Colors.white),
            Container(
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('a'), Text('a')],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('a'), Text('a')],
                  )
                ],
              ),
            ),
            Column(
              children: [
                oneRoomContainer(50, 50, Colors.green),
                oneRoomContainer(50, 50, Colors.lime),
              ],
            ),
          ],
        ),
        Row(
          children: [
            oneRoomContainer(50, 50, Colors.indigo),
            oneRoomContainer(50, 50, Colors.indigo),
            oneRoomContainer(50, 50, Colors.lime),
            oneRoomContainer(50, 50, Colors.lime)
          ],
        ),
      ],
    );
  }

  Widget oneRoomContainer(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          border:
              Border(top: border, bottom: border, left: border, right: border)),
      child: FlatButton(
        onPressed: () {},
        child: Text(' '),
      ),
    );
  }
}
