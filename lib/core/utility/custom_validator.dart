import 'package:faciltateur_de_vies/core/extensions/string_extensions.dart';
import 'package:faciltateur_de_vies/core/utility/strings.dart';
import 'package:intl/intl.dart';

class CustomValidator {
  // check if is input empty or not
  static String? isRequired(String? inputValue) =>
      (inputValue == null || inputValue.isEmpty)
          ? "This Filed is Required"
          : null;

  // check Email address
  static String? validateEmail(String? email) {
    if (isRequired(email) != null) return "E-Mail is invalid";
    bool isValidEmail =
        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email!);
    if (!isValidEmail) {
      return "E-Mail is invalid";
    }
    return null;
  }

  // check Password Strength
  static String? validatePassword(String? password) {
    if (isRequired(password) != null) {
      return "Password must contain one capital letter and on special character and at leaset 12 characters";
    }
    bool isValidEmail =
        RegExp(r"^(?=.*[A-Z])(?=.*[!@#$&*]).{12,}$").hasMatch(password!);
    if (!isValidEmail) {
      return "Password must contain one capital letter and on special character and at leaset 12 characters";
    }
    return null;
  }

  // check if phone number length is not valid.
  static String? validatePhoneNumberLength(String? phoneNumber) {
    if (isRequired(phoneNumber) != null || phoneNumber!.length != 9) {
      return "Phone number is invalid";
    }
    return null;
  }

  // check if phone number is valid or not.
  static String? validatePhoneNumber(String? phoneNumber) {
    if (isRequired(phoneNumber) != null) return "Phone number is invalid";
    String pattern = r'(^(?:[+0][0-9])?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(phoneNumber!)) {
      return "Phone number is invalid";
    }
    return null;
  }

  // check if num of char equals specific num or not
  static String? validateNumOfChar(String? text, {int num = 0}) {
    if (isRequired(text) != null || text!.length < num) {
      return 'Number of char is less than $num';
    }
    return null;
  }

  // check if input value is only contain numbers
  static String? validateOnlyNumber(String text, {int num = 0}) {
    if (isRequired(text) != null || !text.isNumeric) {
      return "The value isn't correct";
    }
    return null;
  }

  static bool validDate(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      if (dateTime.year > DateTime.now().year - 100 &&
          dateTime.year < DateTime.now().year - 18) {
        DateFormat('yyyy-MM-dd').format(dateTime);
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }
}
