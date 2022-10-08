import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';


class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context ,stats){},
      builder: (context,stats){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Settings Screen',
                style: TextStyle(
                    color: NewsCubit.get(context).isDark?Colors.white:Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed:(){
                    NewsCubit.get(context).changeAppMode();
                  },
                  child:Icon(Icons.light_mode_outlined)
              )
            ],
          ),

        );
      },
    );
  }
}