extension IntX on int {
  Duration get minutes => Duration(minutes: this);
  Duration get milliseconds => Duration(milliseconds: this);
}

extension StringX on String {
  String capitalizeFirstLetter() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String removeTrailingCommas() {
    const String _regexp = '\\,(?!\\s*?[\\{\\[\\"\'\\w])';
    print("Formatted is ${replaceAll(RegExp(_regexp), "")}");
    return replaceAll(RegExp(_regexp), "");
  }
}
