
class Catalog{

  int _id;
  String _name;
  String _desc;

  Catalog.name(this._id, this._name, this._desc);

  int get id => _id;

  set id(int value) {
   _id = value;
  }

  String get desc => _desc;

  set desc(String value) {
   _desc = value;
  }

  String get name => _name;

  set name(String value) {
   _name = value;
  }


}