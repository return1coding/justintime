import 'package:flutter/material.dart';
import 'package:justintime/database.dart';
import 'dart:convert';
import 'edititempage.dart';

Widget listItemWidget(
    ListItem listitemobj, AppDatabase database, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print("Tapped");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => itemEditPage(listitemobj),
        ),
      );
      print("Tapped");
    },
    child: Container(
      height: 80,
      color: Color(int.parse(listitemobj.itemColor)),
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              listitemobj.itemName,
              style: TextStyle(
                fontFamily: 'Code8x8',
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Row(
                children: <Widget>[
                  Text(
                    listitemobj.itemLocation,
                    style: TextStyle(
                      fontFamily: 'Code8x8',
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    listitemobj.itemTime,
                    style: TextStyle(
                      fontFamily: 'Code8x8',
                      fontSize: 12,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

//TODO Delete or edit page onTap
