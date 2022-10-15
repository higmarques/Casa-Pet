class SessionManager {
  static String? _token;

  static getToken() {
    return _token;
  }

  static setToken(String token) {
    _token = token;
  }
}
