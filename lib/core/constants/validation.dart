class Validation {
  static const String passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$';
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$';
  static const String phoneNumberRegex = r'^05[54036789]\d{7}$';
  static const String usernameRegex = r'^[a-zA-Z ]+$';
  static const String nameRegex = r'^[a-zA-Z\u0600-\u06FF ]+$';
  static const String idRegex = r'^[0-9]+$';
  static const String onlyNumbersRegex = r'^\d+$';
  static const String number0to100Regex = r'^(100|[1-9]?[0-9])$';
}
