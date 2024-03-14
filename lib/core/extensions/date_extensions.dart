import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension DateOnlyCompare on DateTime {
  // check if date is same as passed date
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // Method to return Time only from date like : 12:00
  String hhmm() {
    return DateFormat.Hm().format(this);
  }

  // Method to return Nth MMM YYYY format like : 3th Jun 2022
  String doMMMyyyy() {
    return Jiffy(this).format("do MMM yyyy");
  }

  // Method to return Nth MMM YYYY format like : 2022 Jun 3th 12:30 
  String yyyyMMMddhh() {
    return Jiffy(this).format("yyyy MMM do hh:mm");
  }

// Method to return dd MMMM YYYY format like : 11 March 2022
  String ddMMMMyyyy() {
    return Jiffy(this).format("dd MMMM yyyy");
  }

  // Method to return MMM . dd format like : Mar.12
  String mmmdd() {
    return Jiffy(this).format("MMM . dd");
  }

  // Method to return yyyy-mm-dd format like : 2022-10-10
  String yyyyMMdd() {
    return Jiffy(this).format("yyyy-MM-dd");
  }

  // Method to return d/M format like : 1/10
  String ddMM() {
    return Jiffy(this).format("d/M");
  }
  // Method to return YYYY format like : 2022

  String yyyy() {
    return Jiffy(this).format("yyyy");
  }
  // Method to return mmmm format like : January

  String mmmm() {
    return Jiffy(this).format("MMMM");
  }

}
