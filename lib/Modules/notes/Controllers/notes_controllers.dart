import 'package:note_app_final/config/config.dart';
import 'package:note_app_final/interface/notes_controller_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notecontroller implements NotescontrollerInterface {
  @override
  Future<bool> addnote(String note) async {
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? notes = handle.getStringList("my_notes");
    if (notes != null) {
      notes.add(note);
      return await handle.setStringList(Config.noteskey, notes);
    } else {
      return await handle.setStringList(Config.noteskey, [note]);
    }
  }

  @override
  Future<bool> deletenote(int index) async {
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? notes = handle.getStringList("my_notes");
    if (notes != null) {
      notes.removeAt(index);
      return await handle.setStringList("my_notes", notes);
    }
    return false;
  }

  @override
  Future<List<String>?> getnotes() async {
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? notes = handle.getStringList("my_notes");
    return notes;
  }

  @override
  Future<bool> updatenotes(int index, String note) async {
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? notes = handle.getStringList("my_notes");
    if (notes != null) {
      notes[index] = note;
      return await handle.setStringList("my_notes", notes);
    }
    return false;
  }
}
