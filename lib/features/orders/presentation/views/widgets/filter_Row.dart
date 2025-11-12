
import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('Filter' , style: TextStyle(fontSize: 20), ),
            SizedBox(width: 20),
            Icon(Icons.filter_list , size: 32, ),
          ],
        ),
      ),
    );
  }
}
