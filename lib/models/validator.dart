import 'package:email_validator/email_validator.dart';

extension ExtString on String {

  static final _passwordValidator = RegExp(r"^(?=.*?[a-z]).{6,}");
  static final _nameRegExp = RegExp(r"\b([a-zà-ỲA-Z][-,a-zA-Z. ']+[ ]*)+");

  bool get isValidEmail {
      return EmailValidator.validate(this);
  }

  bool get isValidName {
    return _nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    return _passwordValidator.hasMatch(this);
  }
}