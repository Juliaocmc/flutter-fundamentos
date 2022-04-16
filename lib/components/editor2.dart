import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;

  Editor(
      {required this.controller,
        required this.label,
        required this.hint,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.00),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
class Editor2 extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;

  Editor2(
      {required this.controller,
        required this.label,
        required this.hint,
        required this.icon});
  @override
  State<StatefulWidget> createState() {
    return Editor2State();
  }
}

class Editor2State extends State<Editor2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(fontSize: 24.00),
        decoration: InputDecoration(
          icon: widget.icon != null ? Icon(widget.icon) : null,
          labelText: widget.label,
          hintText: widget.hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
