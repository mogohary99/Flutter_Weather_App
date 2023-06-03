
extension DateUtil on DateTime {
  bool isSameDay(DateTime day2){
    return DateConverter.isSameDay(this, day2);
  }
}

class DateConverter{
  static bool isSameDay(DateTime nowTime,DateTime priviesTime){
    DateTime now = nowTime.toLocal();
    DateTime privies = priviesTime.toLocal();
    if(now.day ==privies.day && now.month == privies.month && now.year == privies.year){
      return true;
    }
    return false;
  }
}