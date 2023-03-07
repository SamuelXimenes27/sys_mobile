import 'package:design_leveling/app/modules/login/login_module.dart';
import 'package:design_leveling/app/shared/constants/routes_const.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
    ),
    ModuleRoute(
      RoutesConst.login,
      module: LoginModule(),
    ),
  ];
}
