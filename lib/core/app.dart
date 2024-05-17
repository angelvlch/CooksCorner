import 'package:cooks_corner/features/authorization/presentation/authorization_screen.dart';
import 'package:cooks_corner/features/registration/data/data_source/remote_data_source.dart';
import 'package:cooks_corner/features/registration/data/repository/registration_repo.dart';
import 'package:cooks_corner/features/registration/domain/repository/registratrion_repo.dart';
import 'package:cooks_corner/features/registration/domain/use_case/registration_use_case.dart';
import 'package:cooks_corner/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:cooks_corner/features/registration/presentation/registration_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cooks_corner/core/routes/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  Map<String, WidgetBuilder> get _routes {
    return {
      Routes.authorization: (context) => const AuthorizationScreen(),
      Routes.registration: (context) => const RegistrationScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationBloc(
              useCase: RegistrationUseCase(
                  repo: RegistrationRepoImpl(
                      dataSource: RemoteRegistrationDataSource(dio: Dio())))),
        ),
      ],
      child: MaterialApp(
        routes: _routes,
      ),
    );
  }
}
