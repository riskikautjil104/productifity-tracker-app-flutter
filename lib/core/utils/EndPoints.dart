class EndPoints {
  static const _baseUrl = 'https://protracker.azurewebsites.net/api/';

  static const register = _baseUrl + 'auth/register';
  static const login = _baseUrl + 'auth/login';
  static const logout = _baseUrl + 'auth/logout';
  static const getRole = _baseUrl + 'auth/get-role';
  static const forgotPassword = _baseUrl + 'auth/forgot-password';
  static const validateOtp = _baseUrl + 'auth/validate-otp';
  static const resetPassword = _baseUrl + 'auth/reset-password';
  static const getAllProject = _baseUrl + 'auth/project/crew/get-all-project';
  static const createProject = _baseUrl + 'https://protracker.azurewebsites.net/api/project/:name/create-project';
  // String project;
  // String project = _baseUrl + 'auth/project/${name}/get-all-project';

  // static getAllProjectEndpoint(var name) {
  //   String project = _baseUrl + 'auth/project/${name}/get-all-project';
  //   return project;
  // }
}

// http.get(Uri.parse(Apis.loginApi));
// var a = EndPoints.register;