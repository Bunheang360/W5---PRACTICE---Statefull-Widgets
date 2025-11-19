import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectedCard(),
            SizedBox(height: 20),
            SelectedCard(),
            SizedBox(height: 20),
            SelectedCard(),
          ],
        ),
      ),
    ),
  ),
);

class SelectedCard extends StatefulWidget {
  const SelectedCard({super.key});

  @override
  State<SelectedCard> createState() => _SelectedCardState();
}

class _SelectedCardState extends State<SelectedCard> {
  bool isSelected = false;

  void onPressed() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  String get getLabelText => isSelected ? "Selected" : "Not selected";
  Color get getTextColor => isSelected ? Colors.white : Colors.black;
  Color get getBgColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: getBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            getLabelText,
            style: TextStyle(color: getTextColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
