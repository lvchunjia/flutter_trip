import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});

  final List<Color> data = List.generate(128, (i) => Color(0xFFFF00FF - 2 * i));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 100 / 50,
        children: data.map((color) => _buildItem(color)).toList(),
      ),
    );
  }

  Container _buildItem(Color color) => Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          colorString(color),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
            ],
          ),
        ),
      );

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
}
