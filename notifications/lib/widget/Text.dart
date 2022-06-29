import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late String label;
  late TextEditingController tc;
  Size devicesize;
  TextBox(this.label, this.tc, this.devicesize);
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: devicesize.width,
      child: TextFormField(
          controller: tc,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            focusColor: Colors.white,
            border: OutlineInputBorder(),
             focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.0),

             ),
 

            hintText: "$label",

            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )));
    
  }
}