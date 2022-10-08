
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/Network/SharedHelper.dart';
import 'package:new_news/Network/dioHelper.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/NewsLayout/HomeScreen.dart';


void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
  await SharedHelper.init();
   bool? isDark =SharedHelper.getBoolData(value: 'isDark');

  runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;
      const MyApp(@required this.isDark, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context)=>NewsCubit()..getNewsBusiness()..getNewsSport()..getNewsScience()..changeAppMode(
            fromShared: isDark),
        child: BlocConsumer<NewsCubit,NewsStates>(
          listener:(context,state){
          },
          builder:(context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                appBarTheme:const AppBarTheme(
                    iconTheme:IconThemeData(
                        color: Colors.black
                    ) ,
                    actionsIconTheme:IconThemeData(
                        color: Colors.black,
                        size: 30
                    ) ,
                    color: Colors.white,
                    elevation: 0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:20
                    )
                ),
                bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    type: BottomNavigationBarType.fixed
                ) ,
                scaffoldBackgroundColor: Colors.white,
                textTheme:const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis
                    ),
                    bodyText2: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis
                    )
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                appBarTheme: const AppBarTheme(
                    iconTheme:IconThemeData(
                        color: Colors.white
                    ) ,
                    actionsIconTheme:IconThemeData(
                        color: Colors.white,
                        size: 30
                    ) ,
                    color: Colors.black12,
                    elevation: 50,
                    scrolledUnderElevation: 50,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black12,
                      statusBarBrightness:Brightness.light,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:20
                    ),

                ),
                bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black12,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.deepOrange,
                    type: BottomNavigationBarType.fixed
                ) ,
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis
                    ),
                    bodyText2: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis
                    )
                ),
                scaffoldBackgroundColor: Colors.black12,

              ),
              themeMode:NewsCubit.get(context).isDark?ThemeMode.dark
                  :ThemeMode.light,
              home:const HomeScreen(),
            );
          },
        )
    );

  }

}