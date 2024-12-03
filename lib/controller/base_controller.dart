import 'package:template/enum/view_state.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final _state = ViewState.idle.obs;

  final _role = false.obs;

  ViewState get state => _state.value;

  bool get role => _role.value;

  setState(ViewState state) {
    _state.value = state;
  }


}
