import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/Reservations/Home/logic/cubit/main_screen_cubit.dart';
import 'feature/SplashScreen/SplashScreen.dart';
import 'feature/auth/OnBording/logic/bloc.dart';
import 'feature/auth/Register/logic/cubit/register_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<W1Cubitt>(
          create: (BuildContext context) => W1Cubitt(),
        ),
        BlocProvider<RegisterCubit>(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider<MainScreenCubit>(
          create: (BuildContext context) =>
              MainScreenCubit()..configurePusher(),
        ),
      ],
      child: BlocConsumer<MainScreenCubit, MainScreenState>(
        listener: (context, state) {},
        builder: (context, states) {
          return MaterialApp(
            title: 'Flutter  Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
