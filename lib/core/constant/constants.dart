import '../di/injection_container.dart';
import '../shared_preferences/preference_helper.dart';

String? userToken;
String? deviceToken;
String? userPhone;
PreferenceHelper preferenceHelper = PreferenceHelper(preferencesProvider: sl());
