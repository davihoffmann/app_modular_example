import 'package:app_slyde_modular_example/app/app_controller.dart';
import 'package:app_slyde_modular_example/app/app_widget.dart';
import 'package:app_slyde_modular_example/app/modules/home/home_module.dart';
import 'package:app_slyde_modular_example/app/pages/other/other_page.dart';
import 'package:app_slyde_modular_example/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  /*
   * Injenção de Dependência
   */
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  /*
   *  Gerencia de Rotas do Modulo 
   */
  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router(
          '/other/:text',
          child: (BuildContext context, ModularArguments args) => OtherPage(
            text: args.params['text'],
          ),
        )
      ];

  /*
   * Chamar Widget Principal
   */
  @override
  Widget get bootstrap => AppWidget();
}
