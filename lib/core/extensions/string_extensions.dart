// This extension Numeric method on String to check if the string is number or not
// for example  : '1'     => true
//              : 'Test'  => false
extension Numeric on String {
  bool get isNumeric => double.tryParse(this) != null;
}