import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/data_cubit.dart';
import 'package:test_app/cubit/page_cubit.dart';
import 'package:test_app/page/home/home_page.dart';
import 'package:test_app/page/home/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataCubit(),
        ),
        BlocProvider(
          create: (context) => PageCubit(),
        )
      ],
      child: MaterialApp(
        title: 'test app',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => MainPage(),
        },
      ),
    );
  }
}
