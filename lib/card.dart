import 'package:flutter/material.dart';
import 'package:lyqik/object.dart';

Widget card(Vehicle model) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xff00a884)),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Text(
          "Vehicle Number: " + model.vehicleNo,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Vehicle Brand: " + model.brand,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Vehicle Type: " + model.type,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Fuel Type: " + model.fuel,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}
