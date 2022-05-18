import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/cubit.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:jopedia/layout/home_layout.dart';
import 'package:jopedia/modules/create_job/CreateJobScreen.dart';
import 'package:jopedia/modules/home/HomeScreen.dart';
import 'package:jopedia/modules/job_progress/JobProgressScreen.dart';
import 'package:jopedia/modules/login/LoginScreen.dart';
import 'package:jopedia/modules/notification/NotificationScreen.dart';
import 'package:jopedia/modules/notificationTry.dart';
import 'package:jopedia/modules/register/RegisterScreen.dart';
import 'package:jopedia/modules/requests/RequestScreen.dart';
import 'package:jopedia/modules/search/SearchScreen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jopedia/modules/my_profile/ProfilePage.dart';
import 'package:jopedia/modules/deposit/DepositScreen.dart';
import 'package:jopedia/modules/wallet/WalletScreen.dart';
import 'package:jopedia/modules/withdrawal/WithdrawalScreen.dart';
import 'package:jopedia/modules/card/YourCard.dart';
import 'package:jopedia/themes.dart';
import 'package:jopedia/utils/user_preferences.dart';
import 'modules/job_view/JobViewScreen.dart';
import 'modules/pop-up/Homepage.dart';
import 'package:jopedia/modules/contract/ContractScreen.dart';
import 'package:jopedia/modules/notificationTry.dart';
import 'modules/trytimer.dart';

Future main() async {
  WidgetsFlutterBinding?.ensureInitialized();
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
