extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String enumCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')}";
  }
}
