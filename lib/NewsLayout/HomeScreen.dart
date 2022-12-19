import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/conponents/components.dart';
import 'package:new_news/modules/Screens/SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.appBar[cubit.currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, const searchScreen());
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 200,
              items: cubit.itemBottom,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );

        }

    );
  }
}
