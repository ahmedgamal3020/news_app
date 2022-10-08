
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/compoents.dart';

class business extends StatelessWidget {
  const business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){
      },
      builder: (context,state){
        var cubit =NewsCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.newsBusiness.isNotEmpty,
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
          builder:(context) =>buildListOFItems(
              cubit.newsBusiness.length,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              (index) {
                return buildItemList(cubit.newsBusiness[index],context);
        },)







          //     ListView.separated(
          //     physics:const BouncingScrollPhysics() ,
          //     itemCount: cubit.newsBusiness.length,
          //     separatorBuilder: (context,index)=>Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(
          //         width: double.infinity,
          //         height: 1,
          //         color: Colors.grey,
          //       ),
          //     ),
          //     itemBuilder: (context,index)=>
          //         buildItemList(cubit.newsBusiness[index],context)
          // ),

        );
      }
    );
  }
}
