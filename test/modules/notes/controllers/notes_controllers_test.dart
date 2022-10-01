import 'package:note_app_final/Modules/notes/Controllers/notes_controllers.dart';
import 'package:note_app_final/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  test("addnote: should return true", () async {
    //Arrange
    SharedPreferences.setMockInitialValues({
      Config.noteskey: ["one", "two", "three"]
    });

    //Act
    bool isadded = await Notecontroller().addnote("New Note");

    //Assert
    expect(isadded, true);
  });

  test("deletenote: should return true", () async {
    //Arrange
    SharedPreferences.setMockInitialValues({
      Config.noteskey: ["one", "two", "three"]
    });

    //Act
    bool isdeleted = await Notecontroller().deletenote(0);

    //Assert
    expect(isdeleted, true);
  });

  test("getnote: should return true", () async {
    //Arrange
    SharedPreferences.setMockInitialValues({
      Config.noteskey: ["one", "two", "three"]
    });

    //Act
    List<String>? listofnote = await Notecontroller().getnotes();

    //Assert
    expect(listofnote, ["one", "two", "three"]);
  });

  test("update: should return true", () async {
    //Arrange
    SharedPreferences.setMockInitialValues({
      Config.noteskey: ["one", "two", "three"]
    });

    //Act
    bool isupdate = await Notecontroller().updatenotes(1, "Note 20");

    //Asert
    expect(isupdate, true);
  });
}
