import 'package:get/instance_manager.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicpa_news/core/local/shared_pref.dart';
import 'package:sicpa_news/core/network/api_provider.dart';
import 'package:sicpa_news/features/data/datasources/most_popular/most_popular_remote_data_source.dart';
import 'package:sicpa_news/features/data/repositories/most_popular_repository_impl.dart';
import 'package:sicpa_news/features/domain/repositories/most_popular_repository.dart';

import 'core/network/api_interceptor.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Register all neccesary reuse class here
    // Its like injection container
    final sharedPref = await SharedPreferences.getInstance();
    Get.put(
      SharedPreferencesManager(sharedPreferences: sharedPref),
      permanent: true,
    );
    // API PROVIDER
    Get.put(
      ApiInterceptor(
        sharedPreferencesManager: Get.find(),
      ),
      permanent: true,
    );
    Get.put<ApiProvider>(
      ApiProviderImpl(
        Get.find(),
      ),
      permanent: true,
    );
    // DATA SOURCE
    Get.put<MostPopularRemoteDataSource>(
      MostPopularRemoteDataSourceImpl(
        apiProvider: Get.find(),
      ),
      permanent: true,
    );
    Get.put<MostPopularRepository>(
      MostPopularRepositoryImpl(
        remoteDataSource: Get.find(),
        apiProvider: Get.find(),
      ),
      permanent: true,
    );
  }
}
