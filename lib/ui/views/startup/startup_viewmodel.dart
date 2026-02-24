import 'package:flutter_task_mohsin/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';



class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _navigationService.replaceWithCountryDetailView();
  }
}
