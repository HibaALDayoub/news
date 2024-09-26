import 'dart:io';

checkInternetConnection() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    // مافهمتا
    // if (result.isNotEmpty) {
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    return false;
  }
}
