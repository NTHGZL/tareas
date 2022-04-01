class User{
  String? _name;
  String? _email;
  String? _lastname;
  String? _jwt;
  String? _id;

  User(this._name, this._email, this._lastname, this._jwt, this._id);

  String? get name => _name;
  String? get email => _email;
  String? get lastname => _lastname;
  String? get jwt => _jwt;
  String? get id => _id;


}