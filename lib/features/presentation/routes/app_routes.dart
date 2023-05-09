import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_binding.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_screen.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_binding.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_screen.dart';
import 'package:sicpa_news/features/presentation/screens/splash/splash_binding.dart';
import 'package:sicpa_news/features/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const initial = SplashScreen.routeName;

  static List<GetPage> pages() {
    return [
      GetPage(
        name: SplashScreen.routeName,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: ArticleScreen.routeName,
        page: () => const ArticleScreen(),
        binding: ArticleBinding(),
      ),
    ];
  }
}
