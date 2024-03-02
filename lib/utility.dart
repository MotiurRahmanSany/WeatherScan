extension CapitalizeFirstLetter on String {
  String capFirstLetter() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}