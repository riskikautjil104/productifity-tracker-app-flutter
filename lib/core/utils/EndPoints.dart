class EndPoints {
  static const _baseUrl = 'https://protracker.azurewebsites.net/api/';

  static const register = _baseUrl + 'auth/register';
  static const login = _baseUrl + 'auth/login';
  static const logout = _baseUrl + 'auth/logout';
  static const getRole = _baseUrl + 'auth/get-role';
  static const forgotPassword = _baseUrl + 'auth/forgot-password';
  static const validateOtp = _baseUrl + 'auth/validate-otp';
  static const resetPassword = _baseUrl + 'auth/reset-password';
}

// http.get(Uri.parse(Apis.loginApi));
// var a = EndPoints.register;