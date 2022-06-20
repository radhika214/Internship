import 'package:flutter/material.dart';
import '../widgets/DropDown.dart';
import '../widgets/listview.dart';


class ListOfUniversities extends StatelessWidget {
  const ListOfUniversities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Universities',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 237, 222),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Country Filter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white38,
              ),
              child: DropdownButtonHideUnderline(
                  child: DropDownButton() //  Dropdown Widget
                  ),
            ) ],
            ),
            
            SizedBox(
              height: 10,
            ),
            ListViewWidget() //ListView Widget
          ],
        ));
    
        
  }
}
