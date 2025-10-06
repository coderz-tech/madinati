class IO {
  static bool isDebugger = true;
  static final String TOKEN_KEY = "_token";
  static final String ACCESS_TOKEN_KEY = "_access_token";
  static final String AUTH_MODEL_KEY = "_auth";
  static final String LANGUAGE_MODEL_KEY = "_language";
  static final String ITEMS_MODEL_KEY = "_product";

  static void printFullText(String text) {
    if (!isDebugger) return;
    final pattern = RegExp('.{1,800}');
    // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => printOk(match.group(0)!));
  }

  static void printWarning(String text) {
    if (!isDebugger) return;
    if (text.isEmpty) return;
    print('\x1B[33m$text\x1B[0m');
  }

  static void printError(String text) {
    if (!isDebugger) return;
    if (text.isEmpty) return;
    print('\x1B[31m$text\x1B[0m');
  }

  static void printOk(String text) {
    if (!isDebugger) return;
    if (text.isEmpty) return;
    print('\x1B[32m$text\x1B[0m');
  }

  static void printBlue(String text) {
    if (!isDebugger) return;
    if (text.isEmpty) return;
    print('\x1B[34m$text\x1B[0m');
  }
}
