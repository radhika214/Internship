import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universitylinks/widgets/listview.dart';
import '../provider/data_provider.dart';

class DropDownButton extends StatelessWidget {
  String dropdownvalue = '';
  // List of items in our dropdown menu
  var items = [
    'India',
    'United States',
    'Afghanistan',
    'Albania',
    'Italy',
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton(
            value: dropdownvalue = ref.watch(dropdownProvider), // Initial Value

            icon: const Icon(Icons.keyboard_arrow_down), // Down Arrow Icon

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              ref.read(dropdownProvider.notifier).change(newValue!);
              print(newValue);
              ref.refresh(universityStateFuture);
              ListViewWidget();
            });
      },
    );
  }
}
