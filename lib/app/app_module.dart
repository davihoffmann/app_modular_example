import 'package:app_slyde_modular_example/app/app_controller.dart';
import 'package:app_slyde_modular_example/app/app_widget.dart';
import 'package:app_slyde_modular_example/app/pages/home/home_controller.dart';
import 'package:app_slyde_modular_example/app/pages/home/home_page.dart';
import 'package:app_slyde_modular_example/app/pages/other/other_page.dart';
import 'package:app_slyde_modular_example/app/shared/repositories/poke_repository.dart';
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
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  /*
   *  Gerencia de Rotas do Modulo 
   */
  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (BuildContext context, ModularArguments args) => HomePage(),
        ),
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
