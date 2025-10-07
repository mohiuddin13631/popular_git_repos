// ignore_for_file: constant_identifier_names

class Environment {

  static const appName = "Popular Git Repos";
  static const appVersion = "1.0.0";

  //DEV MODE ==> false if production
  static const bool DEV_MODE = true;

  // API END POINT URL
  static const MAIN_API_URL = DEV_MODE ? TEST_API_URL : LIVE_API_URL; // Don't touch here

  static const LIVE_API_URL = 'https://api.github.com'; //Live end Point URL

  static const TEST_API_URL = 'https://api.github.com'; //Local or demo or test URL
  // API END POINT URL END
}
