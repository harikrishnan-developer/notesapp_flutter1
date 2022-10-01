import 'package:flutter/material.dart';
import 'package:note_app_final/Modules/notes/Controllers/notes_controllers.dart';
import 'package:note_app_final/Modules/notes/Views/AddNote_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => AddNote()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "NOTISTIC",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "-notes",
              style: TextStyle(color: Colors.green),
            ),
            Text(
              "app",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              future: Notecontroller().getnotes(),
              builder: (BuildContext context, AsyncSnapshot<List<String>?> sn) {
                if (sn.hasData) {
                  List<String>? notes = sn.data;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: notes!.length,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Card(
                            color: Colors.redAccent,
                            child: Text(
                              "${notes[index]}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () async {
                              print("delete procced${index}");
                              String msg = "Nothing Happend";
                              bool isdeleted =
                                  await Notecontroller().deletenote(0);

                              if (isdeleted) {
                                msg = "Note succefully deleted";
                              } else {
                                msg = "Note not succesfully deleted";
                              }
                              final snackBar = SnackBar(
                                content: Text(msg),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.delete),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else if (sn.hasError) {
                  return Text("data not found");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {});
                },
                child: Icon(Icons.refresh),
              ),
            ),
          )
        ],
      ),
    );
  }
}
