import 'package:jiffy/jiffy.dart';


/// This class to help us to handle operation on date and time
class DateHelper {
  /// this fn to convert the date string to specific format 'YYYY-MM-dd' otherwise return empty space
  static String yyyyMMdd(String date) {
    try {
      return Jiffy(DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000))
          .format("yyyy-MM-dd");
    }catch(e){
      return "";
    }
  }
  /// this fn to convert the time stamp int and return DateTime object
  static DateTime dateFromTimeStamp(int timeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  }

  /// this fn to convert the date string to specific format 'HH:MM' time only and otherwise return String 'yyyy-MM-dd' as a string

  static String hhmm(String date) {
    try {
      return Jiffy(DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000))
          .format("hh:mm");
    } catch (e) {
      return "yyyy-MM-dd";
    }
  }
}
