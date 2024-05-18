import 'package:cooks_corner/features/authorization/data/remote/authorization_data_source.dart';
import 'package:cooks_corner/features/authorization/data/repository/authorization_repo_imp.dart';
import 'package:cooks_corner/features/authorization/domain/use_case/authorization_use_case.dart';
import 'package:cooks_corner/features/authorization/presentation/authorization_screen.dart';
import 'package:cooks_corner/features/authorization/presentation/bloc/authorization_bloc.dart';
import 'package:cooks_corner/features/main/presentation/main_screen.dart';
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
      Routes.main: (context) => const MainScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthorizationBloc(
            useCase: AuthorizationUseCase(
              repo: AuthorizationRepoImp(
                dataSource: AuthorizationDataSource(dio: Dio()),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            useCase: RegistrationUseCase(
              repo: RegistrationRepoImpl(
                dataSource: RemoteRegistrationDataSource(dio: Dio()),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        routes: _routes,
      ),
    );
  }
}
