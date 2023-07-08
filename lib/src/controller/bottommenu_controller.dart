import 'package:mobx/mobx.dart';

part 'bottommenu_controller.g.dart';

class BottomMenuController = BottomMenuControllerBase
    with _$BottomMenuController;

abstract class BottomMenuControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void onTabTapped(int index) {
    currentIndex = index;
  }
}
