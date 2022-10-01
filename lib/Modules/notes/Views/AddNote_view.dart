import 'package:flutter/material.dart';
import 'package:note_app_final/Modules/notes/Controllers/notes_controllers.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController notetextcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Write your notes",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: notetextcontroller,
                maxLines: 6,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Write your text"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () async {
                    String msg = "No msg";
                    bool isadded =
                        await Notecontroller().addnote(notetextcontroller.text);
                    if (isadded) {
                      msg = "Note succefully save";
                    } else {
                      msg = "Note not succesfully saved";
                    }
                    final snackBar = SnackBar(
                      content: Text(msg),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text("Save")),
            ),
          ],
        ),
      ),
    );
  }
}
