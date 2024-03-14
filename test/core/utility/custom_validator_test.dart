import 'package:faciltateur_de_vies/core/utility/custom_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // init
  String? emptyValue,
      notEmptyValue,
      validPassword,
      notValidPassword,
      validEmail,
      notValidEmail,
      validPhone,
      notValidPhone,
      validNumberChar,
      notValidNumberChar;
  // init variables before run test case
  setUp(() {
    emptyValue = '';
    notEmptyValue = 'any value';
    validPassword = 'Mohammad@12345';
    notValidPassword = '123456789012';
    validEmail = "sheriinalii98@hotmail.com";
    notValidEmail = "em@juha";
    validPhone = "+4917634247397";
    notValidPhone = "712";
    validNumberChar = "12345678";
    notValidNumberChar = "1234";
  });
  //  free memory variable after test case ended
  tearDown(() {
    emptyValue = null;
    notEmptyValue = null;
    validEmail = null;
    notValidEmail = null;
    validPhone = null;
    notValidPhone = null;
    validNumberChar = null;
    notValidNumberChar = null;
  });

  // check if filed is not empty and the result should be String as "This Filed is Required".
  test(
      "Success isRequired Filed test case should  return String as This Filed is Required",
      () {
    expect("This Filed is Required", CustomValidator.isRequired(emptyValue));
  });

  // check if filed is not empty and the result should be null value
  test("Failure isRequired Filed test case should  return null", () {
    expect(null, CustomValidator.isRequired(notEmptyValue));
  });
  // check if filed is email and the result should be null value
  test("Success Email Filed test case and should  return null", () {
    expect(null, CustomValidator.validateEmail(validEmail));
  });
  // check if filed is not email and the result should be String as E-Mail is invalid
  test("Failure Email Filed test case and should  return failure message", () {
    expect("E-Mail is invalid", CustomValidator.validateEmail(notValidEmail));
  });
  test("Success password Filed test case and should return null", () {
    expect(null, CustomValidator.validatePassword(validPassword));
  });
  // check if filed is not email and the result should be String as E-Mail is invalid
  test("Failure password Filed test case and should return failure message",
      () {
    expect(
        "Password must contain one capital letter and on special character and at leaset 12 characters",
        CustomValidator.validatePassword(notValidPassword));
  });
  // phone number test case (success state)
  test(
      "Success phone number test case should  return String Phone number is invalid",
      () {
    expect("Phone number is invalid",
        CustomValidator.validatePhoneNumber(notValidPhone));
  });
  // phone number test case (failure state)
  test("Failure phone number test case should  return null value ", () {
    expect(null, CustomValidator.validatePhoneNumber(validPhone));
  });

  // free text test case (success state)
  test("Success Free Text should return null value ", () {
    expect(null, CustomValidator.validateNumOfChar(validNumberChar));
  });
  // free text test case (success state)
  test("Failure free text should return 'number of char is less than num", () {
    expect("Number of char is less than ${notValidNumberChar!.length + 1}",
        CustomValidator.validateNumOfChar(notValidNumberChar, num: 5));
  });
}
