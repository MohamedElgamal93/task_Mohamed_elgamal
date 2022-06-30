
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskproject/util/strings.dart';
import '../bussniess_logic/home_cubit.dart';
import '../data/repositorys/reositories.dart';
import '../data/repositorys/requests.dart';
import '../presentation/screens/home_page.dart';


class AppRouter {
  late Repositories repositories;

  AppRouter() {
    repositories = Repositories(RequestsRepository());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
       case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomeCubit(Repositories(RequestsRepository())),
            child: const HomePage(),
          ),
        );
    }
    return null;
  }
}
