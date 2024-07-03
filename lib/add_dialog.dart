import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  var namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      children: [
        TextField(
          controller: namecontroller,
        ),
        OutlinedButton(
            onPressed: () {
              if (namecontroller.text.isEmpty) {
                Fluttertoast.showToast(msg: "enter name");
              } else {
                Navigator.of(context).pop(namecontroller.text);
              }
            },
            child: Text("add name"))
      ],
    ));
  }
}
