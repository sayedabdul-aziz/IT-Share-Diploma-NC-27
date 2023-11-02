class AppFunctions {
  static String replaceFarsiNumber(String input) {
    String result = input;
    result = result.replaceAll('0', '۰');
    result = result.replaceAll('1', '١');
    result = result.replaceAll('2', '٢');
    result = result.replaceAll('3', '٣');
    result = result.replaceAll('4', '٤');
    result = result.replaceAll('5', '٥');
    result = result.replaceAll('6', '٦');
    result = result.replaceAll('7', '٧');
    result = result.replaceAll('8', '٨');
    result = result.replaceAll('9', '٩');
    return result;
  }
}
