class User{
  final String _name;
  final String _email;
  final String _lastname;
  final String _id;

  User(this._name, this._email, this._lastname, this._id);

  String get name => _name;
  String get email => _email;
  String get lastname => _lastname;
  String get id => _id;

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'email': _email,
      'lastname': _lastname,
      'id': _id,
    };
  }

  String getFullName() {
    return _name[0].toUpperCase() + _name.substring(1) + ' ' + _lastname[0].toUpperCase() + _lastname.substring(1);
  }

  String getInitials() {
    return _name[0].toUpperCase() + _lastname[0].toUpperCase();
  }

  @override
  String toString(){
    return _email;
  }

  factory User.fromMap(Map<String, dynamic> map) {

    return User(
      map['name'],
      map['email'],
      map['lastname'],
      map['id'].toString(),
    );
  }



}