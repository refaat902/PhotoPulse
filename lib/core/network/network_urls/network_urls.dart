class NetworkURLS {
  static const isDev = true; // Set to true for development, false for production
  static const isPayWithSandBox = isDev ? true : false;

  // staging : https://staging-core.neqabty.ai --- dev : https://dev-core.neqabty.ai
  static const String baseDevURL = "https://staging-core.neqabty.ai";
  static const String baseBetaURL = "https://community.neqabty.com";
  static const String baseURL = isDev ? baseDevURL : baseBetaURL;

  static const String loginEndPoint = "/api/auth-token";
  static const String logoutEndPoint = "/api/logout";
  static const String deleteAccountEndPoint = "/api/accounts/delete_account";
  static const String phoneInquiryEndPoint = "/api/accounts/enquiry";
  static const String registerEndPoint = "/api/accounts/register";
  static const String getProfileEndPoint = "/api/accounts/profile";
  static const String resetPasswordEndPoint = "/api/accounts/forget_password";
  static const String verifyOtpEndPoint = "/api/accounts/forget_password";
  static const String createNewPasswordEndPoint = "/api/accounts/reset_password";
  static const String updateProfileEndPoint = "/api/update_account_profile";
  static const String changePasswordEndPoint = "/api/accounts/change_password";
  static const String getApiConfigurationsEndPoint = "/api/api_configurations";
}
