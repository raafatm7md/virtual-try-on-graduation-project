import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/core/utilits/functions/shared_pref.dart';

class ProfileRepo {
  static Future<void> logout() async {
    await ApiService.post(
      url: '/logout',
      data: {'refresh_token': CacheHelper.getData('refreshToken')},
    );
  }
}
