class Util {
  static bool isEmpty(Object text) {
    if (text is String) return text == null || text.isEmpty;
    if (text is List) return text == null || text.isEmpty;
    return text == null;
  }
}
