import 'package:popular_git_repos/core/imports/app_imports.dart';

class MyUtils {
  static void splashScreen() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  static void allScreen() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static Brightness getOppositeBrightness(Color color) {
    // Calculate the relative luminance of the color
    double luminance = color.computeLuminance();

    // Return the opposite brightness
    return luminance > 0.5 ? Brightness.dark : Brightness.light;
  }

  static Color colorFromHex(String hexColor, {required Color defColor}) {
    try {
      final buffer = StringBuffer();
      if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
      buffer.write(hexColor.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return defColor;
    }
  }

  String colorToHex(Color color, {bool includeHash = true}) {
    int alpha = (color.a * 255).round();
    int red = (color.r * 255).round();
    int green = (color.g * 255).round();
    int blue = (color.b * 255).round();

    return '${includeHash ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }


  String maskSensitiveInformation(String input) {
    if (input.isEmpty) {
      return '';
    }

    final int maskLength = input.length ~/ 2; // Mask half of the characters.
    final String mask = '*' * maskLength;
    final String maskedInput = maskLength > 4 ? input.replaceRange(5, maskLength, mask) : input.replaceRange(0, maskLength, mask);
    return maskedInput;
  }


  List<Row> makeTwoPairWidget({required List<Widget> widgets}) {
    List<Row> pairs = [];
    for (int i = 0; i < widgets.length; i += 2) {
      Widget first = widgets[i];
      Widget? second = (i + 1 < widgets.length) ? widgets[i + 1] : const SizedBox();

      pairs.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: first),
            const SizedBox(width: Dimensions.space15),
            Expanded(child: second),
          ],
        ),
      );
    }

    return pairs;
  }

  void stopLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  static bool isImage(String path) {
    if (path.contains('.jpg')) {
      return true;
    }
    if (path.contains('.png')) {
      return true;
    }
    if (path.contains('.jpeg')) {
      return true;
    }
    return false;
  }

  static bool isXlsx(String path) {
    if (path.contains('.xlsx')) {
      return true;
    }
    if (path.contains('.xls')) {
      return true;
    }
    if (path.contains('.xlx')) {
      return true;
    }
    return false;
  }

  static bool isDoc(String path) {
    // Define a list of supported file extensions
    const List<String> fileTypes = ['.pdf', '.doc', '.docx', '.xls', '.xlsx'];

    // Check if the path contains any of the file extensions
    for (String fileType in fileTypes) {
      if (path.contains(fileType)) {
        return true;
      }
    }
    return false;
  }

  static Icon getFileIcon(String path, {double size = 24.0, Color? color}) {
    // Map file types to specific icons and default colors
    if (path.endsWith('.pdf')) {
      return Icon(Icons.picture_as_pdf, color: color ?? Colors.red, size: size);
    } else if (path.endsWith('.doc') || path.endsWith('.docx')) {
      return Icon(Icons.description, color: color ?? Colors.blue, size: size);
    } else if (path.endsWith('.xls') || path.endsWith('.xlsx')) {
      return Icon(Icons.table_chart, color: color ?? Colors.green, size: size);
    } else if (path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png')) {
      return Icon(Icons.image, color: color ?? Colors.orange, size: size);
    } else if (path.endsWith('.mp4') || path.endsWith('.mov')) {
      return Icon(Icons.videocam, color: color ?? Colors.purple, size: size);
    } else if (path.endsWith('.mp3') || path.endsWith('.wav')) {
      return Icon(Icons.audiotrack, color: color ?? Colors.teal, size: size);
    } else {
      // Default icon for other file types
      return Icon(
        Icons.insert_drive_file,
        color: color ?? Colors.grey,
        size: size,
      );
    }
  }

  static bool isURL(String urlString) {
    Uri? uri = Uri.tryParse(urlString);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  static TextInputType getInputTextFieldType(String type) {
    if (type == "email") {
      return TextInputType.emailAddress;
    } else if (type == "number") {
      return TextInputType.number;
    } else if (type == "url") {
      return TextInputType.url;
    }
    return TextInputType.text;
  }

  static bool getTextInputType(String type) {
    if (type == "text") {
      return true;
    } else if (type == "email") {
      return true;
    } else if (type == "number") {
      return true;
    } else if (type == "url") {
      return true;
    } else if (type == "textarea") {
      return true;
    }
    return false;
  }

  /// Get the default download directory for the platform
  // Helper function to check and request permissions

  Future<bool> checkAndRequestStoragePermission() async {
    if (Platform.isAndroid) {
      // Use device_info_plus to check Android version
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      int androidVersion = androidInfo.version.sdkInt;

      if (androidVersion >= 30) {
        // For Android 11 and higher (SDK 30+)
        var status = await Permission.mediaLibrary.status;
        if (!status.isGranted) {
          status = await Permission.mediaLibrary.request();
        }
        return status.isGranted;
      } else {
        // For Android 10 and below
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
        }
        return status.isGranted;
      }
    } else if (Platform.isIOS) {
      // On iOS, check photo library or media permissions
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }
      return status.isGranted;
    } else {
      // For other platforms (e.g., web, desktop), return true
      return true;
    }
  }

  static bool checkTextIsOnlyNumber(String text) {
    try {
      if (RegExp(r'^[0-9]+$').hasMatch(text)) {
        return true;
      } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(text)) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  String? validateAmountForm({
    required String value,
    required double userCurrentBalance,
    required double minLimit,
    required double maxLimit,
    bool showCurrentBalance = true,
  }) {
    // Check if the value is empty
    if (value.isEmpty) {
      return AppStrings.kAmountNumberError;
    }

    // Convert the value to a double for comparison
    double amount = AppConverter.formatNumberDouble(value);

    if (showCurrentBalance) {
      // Check if the amount exceeds the user current balance
      if (amount > userCurrentBalance) {
        return AppStrings.kAmountHigherError;
      }
    }

    // Check if the amount exceeds the maximum limit
    if (amount > maxLimit) {
      return AppStrings.kAmountExceedMaxLimitError;
    }

    // Check if the amount is less than the minimum limit
    if (amount < minLimit) {
      return AppStrings.kAmountExceedMinLimitError;
    }

    // Return null if all validations pass
    return null;
  }

  List<String> quickMoneyStringList(
    double minLimit,
    double maxLimit, {
    double? step,
    int maxListLength = 5,
  }) {
    List<String> moneyList = [];

    // Determine the step size dynamically if step is null
    if (step == null) {
      // Determine the step size based on maxLimit if step is not provided
      if (maxLimit > 1000) {
        // For large maxLimit, use a larger step
        step = 500.00;
      } else if (maxLimit > 500) {
        // For medium maxLimit, use a medium step
        step = 100.00;
      } else {
        // For smaller maxLimit, use a smaller step
        step = 50.00;
      }
    }

    // Loop through the range from minLimit to maxLimit using the determined step
    for (double amount = minLimit; amount <= maxLimit; amount += step) {
      // Ensure the value is rounded to the nearest valid step value
      double roundedAmount = (amount / step).round() * step;

      // Skip adding 0
      if (roundedAmount > 0) {
        moneyList.add(
          roundedAmount.toStringAsFixed(0),
        ); // Format as integer string
      }

      // If the list reaches the maxListLength, break out of the loop
      if (moneyList.length >= maxListLength) {
        break;
      }
    }

    return moneyList;
  }
}

void printX(Object? object) {
  if (Environment.DEV_MODE) {
    // print(object);
    var logger = Logger();
    logger.i("$object");
  }
}

void printE(Object? object) {
  if (Environment.DEV_MODE) {
    // print(object);
    var logger = Logger();
    logger.e("$object");
  }
}

void printW(Object? object) {
  if (Environment.DEV_MODE) {
    // print(object);
    var logger = Logger();
    logger.w("$object");
  }
}

Future<bool> checkInternetConnection() async {
  final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  } else {
    return false;
  }
}


