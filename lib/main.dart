import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/Network/SharedHelper.dart';
import 'package:new_news/Network/dioHelper.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/NewsLayout/HomeScreen.dart';
import 'package:new_news/conponents/constants.dart';
import 'package:new_news/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedHelper.init();
  isDark = SharedHelper.getBoolData(value: 'isDark');

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({required this.isDark, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()
          ..getNewsBusiness()
          ..getNewsSport()
          ..getNewsScience()
          ..changeAppMode(fromShared: isDark),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder:(context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const HomeScreen(),
            );
          },
        )
    );

  }

}