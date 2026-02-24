import 'package:flutter_task_mohsin/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';


/// ViewModel for the startup view.
/// Handles initial app logic and navigation.
class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  /// Runs startup logic and navigates to the country detail screen.
  Future<void> runStartupLogic() async {
    // Simulate a brief loading delay
    await Future.delayed(const Duration(milliseconds: 500));
    _navigationService.replaceWithCountryDetailView();
  }
}
