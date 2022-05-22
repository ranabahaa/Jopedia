import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/cubit.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:jopedia/modules/login/LoginScreen.dart';
import 'package:flutter/services.dart';
import 'bloc/bloc_Observer.dart';

  void main() async {
  WidgetsFlutterBinding?.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAEs7gK2EC-rTaFUSTuAPI5Vp7nsb2HMTc",
        appId: "1:819907602066:android:9b2ebd5b9ef2bb4767a84b",
        messagingSenderId: "819907602066",
        projectId: "jopedia-921b1",
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {

    final user_data = FirebaseAuth.instance.currentUser;

    String? uId = user_data?.uid;

    return BlocProvider(
        create: (context) {
          return AppBloc()..GetPostsData();
        },
        child: BlocConsumer<AppBloc, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                //theme: ThemeProvider.of(context),
                title: title,
                home: LoginScreen(),
              );
            }),

    );
  }
}
