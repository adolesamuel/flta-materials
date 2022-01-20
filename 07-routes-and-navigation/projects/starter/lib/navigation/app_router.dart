import 'package:flutter/cupertino.dart';
import 'package:fooderlich/screens/screens.dart';

import '../models/models.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState>? navigatorKey;

  final AppStateManager appStateManager;

  final GroceryManager groceryManager;

  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  // Dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        //: Add SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),
// TODO: Add LoginScreen
// TODO: Add OnboardingScreen
// TODO: Add Home
// TODO: Create new item
// TODO: Select GroceryItemScreen
// TODO: Add Profile Screen
// TODO: Add WebView Screen
      ],
    );
  }

  // Add _handlePopPage
  bool _handlePopPage(
// 1
      Route<dynamic> route,
// 2
      result) {
// 3
    if (!route.didPop(result)) {
// 4
      return false;
    }
// 5
// TODO: Handle Onboarding and splash
// TODO: Handle state when user closes grocery item screen
// TODO: Handle state when user closes profile screen
// TODO: Handle state when user closes WebView screen
// 6
    return true;
  }

// 10
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
