import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateDialog extends StatefulWidget {
  final String text;
  const UpdateDialog(String list, {super.key, required this.text});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  var namecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecontroller.text = widget.text;
  }

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
