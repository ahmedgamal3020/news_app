import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/conponents/components.dart';

class science extends StatelessWidget {
  const science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){
        },
        builder: (context,state){
          var cubit =NewsCubit.get(context).newsScience;
          return ConditionalBuilder(
            condition: cubit.isNotEmpty,
            fallback: (context)=>const Center(child: CircularProgressIndicator()),
            builder:(context) =>buildListOFItems(
                cubit.length,
                Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
          ),
                    (index) {
                  return buildItemList(cubit[index],context);
                    }
            )


          );
        }
    );

  }
}
//https://newsapi.org/v2/top-headlines?country=eg&apiKey=cdad916ab5184dccaa943436cdae85d1