abstract class NotescontrollerInterface {
  Future<List<String>?> getnotes();
  Future<bool> addnote(String note);
  Future<bool> deletenote(int index);
  Future<bool> updatenotes(int index, String note);
}
