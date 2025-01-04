

extension StringX on String {
  

  // Basic String Manipulations
  String clear() => '';

  String deleteLastChar() => isNotEmpty ? substring(0, length - 1) : this;

  String append(String value) => this + value;

  String prepend(String value) => value + this;

  String removeSpaces() => replaceAll(' ', '');

  String removeExtraSpaces() => trim().replaceAll(RegExp(r'\s+'), ' ');

  // Case Transformations
  String get capitalize => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;

  String get titleCase => split(' ').map((word) => word.capitalize).join(' ');

  String get camelCase {
    final words = titleCase.split(' ');
    if (words.isEmpty) return this;
    return words.first.toLowerCase() + words.skip(1).join();
  }

  String get constantCase => toUpperCase().replaceAll(' ', '_');

  String get snakeCase => toLowerCase().replaceAll(' ', '_');

  String get kebabCase => toLowerCase().replaceAll(' ', '-');

  String get pascalCase => titleCase.replaceAll(' ', '');

  // Name Handling
  String get initials {
    if (isEmpty) return '';
    final parts = trim().split(' ');
    return parts.map((part) => part[0].toUpperCase()).join();
  }

  String get firstName => split(' ').first;

  String get lastName => split(' ').length > 1 ? split(' ').last : '';

  String get middleName {
    final parts = split(' ');
    return parts.length > 2 ? parts.sublist(1, parts.length - 1).join(' ') : '';
  }

  // Text Modifications
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }

  String limit(int maxLength, {String ellipsis = '...'}) =>
      length > maxLength ? '${substring(0, maxLength)}$ellipsis' : this;

  String padBoth(int length, [String pad = ' ']) {
    if (this.length >= length) return this;
    final totalPadding = length - this.length;
    final leftPad = totalPadding ~/ 2;
    final rightPad = totalPadding - leftPad;
    return pad * leftPad + this + pad * rightPad;
  }

  // Validation Checks
  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);

  bool get isValidPhone => RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(this);

  bool get isValidUrl =>
      RegExp(r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$')
          .hasMatch(this);

  bool get isValidUsername => RegExp(r'^[a-zA-Z0-9_]{3,20}$').hasMatch(this);

  bool get isValidPassword =>
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(this);

  bool get isNumeric => RegExp(r'^\d+$').hasMatch(this);

  bool get isAlpha => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);

  // Number Conversions
  int? toIntOrNull() => int.tryParse(this);

  double? toDoubleOrNull() => double.tryParse(this);

  num? toNumOrNull() => num.tryParse(this);

  int toInt() => int.parse(this);

  double toDouble() => double.parse(this);

  // Path and URL Handling
  String get fileExtension => contains('.') ? split('.').last : '';

  String get fileName => split('/').last;

  String get fileNameWithoutExtension =>
      fileName.contains('.') ? fileName.split('.').first : fileName;

  String get pathWithoutFileName => substring(0, lastIndexOf('/'));

  String get urlHost => Uri.parse(this).host;

  String get urlPath => Uri.parse(this).path;

  String get urlQueryParameters => Uri.parse(this).query;

  // HTML/XML Handling
  String get stripHtmlTags => replaceAll(RegExp('<[^>]*>'), '');

  // Content Checks
  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullOrEmpty => isNotEmpty;

  bool get isNullOrWhitespace => trim().isEmpty;

  bool get isNotNullOrWhitespace => trim().isNotEmpty;

  bool get hasUpperCase => contains(RegExp('[A-Z]'));

  bool get hasLowerCase => contains(RegExp('[a-z]'));

  bool get hasNumber => contains(RegExp(r'\d'));

  bool get hasSpecialCharacter => contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  // Text Analysis
  int get wordCount => trim().split(RegExp(r'\s+')).length;

  List<String> get words => trim().split(RegExp(r'\s+'));

  Map<String, int> get wordFrequency {
    final map = <String, int>{};
    for (final word in words) {
      map[word] = (map[word] ?? 0) + 1;
    }
    return map;
  }

  String get mostCommonWord {
    if (isEmpty) return '';
    return wordFrequency.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  // Custom Formatting
  String replaceLast(Pattern from, String to) {
    if (isEmpty) return this;
    final matches = from.allMatches(this);
    if (matches.isEmpty) return this;
    final lastMatch = matches.last;
    return replaceRange(lastMatch.start, lastMatch.end, to);
  }

  String mask({
    int visibleChars = 0,
    String maskChar = '*',
    bool keepFirst = false,
    bool keepLast = false,
  }) {
    if (isEmpty) return this;
    final buffer = StringBuffer();
    final lengthToMask = length - visibleChars;
    if (keepFirst) buffer.write(this[0]);
    buffer.write(maskChar * lengthToMask);
    if (keepLast) buffer.write(this[length - 1]);
    return buffer.toString();
  }
}
