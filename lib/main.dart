import 'package:albums_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AlbumsBlocObserver();
  runApp(AlbumApp());
}

class AlbumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      initialRoute: '/',
      routes: {'/': (context) => HomeScreen()},
    );

  }
}

class AlbumsBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('event');
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print('change');
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('transition');
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('error');
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}
