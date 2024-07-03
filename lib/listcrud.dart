import 'package:crud/add_dialog.dart';
import 'package:crud/update_dialog.dart';
import 'package:flutter/material.dart';

class Listcrud extends StatefulWidget {
  const Listcrud({super.key});

  @override
  State<Listcrud> createState() => _ListcrudState();
}

class _ListcrudState extends State<Listcrud> {
  var list = <String>["black", "red", "green"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list CRUD"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, Index) {
            return Row(
              children: [
                Expanded(child: Text(list[Index])),
                GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => UpdateDialog(
                                list[Index],
                                text: 'hello',
                              )).then(
                        (value) {
                          list[Index] = value;
                          setState(() {});
                        },
                      );
                    }),
                GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () {
                    list.removeAt(Index);
                    setState(() {});
                  },
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddDialog())
              .then((value) {
            list.add(value);
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
