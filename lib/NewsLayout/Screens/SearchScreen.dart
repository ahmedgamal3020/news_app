import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_news/NewsLayout/Cubit/Cubit.dart';
import 'package:new_news/NewsLayout/Cubit/States.dart';
import 'package:new_news/compoents.dart';


class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController textController =TextEditingController();
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =NewsCubit.get(context);
        return Scaffold(
            appBar: AppBar(title: Text('Search',),
                centerTitle: true,
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFromField(
                      ontap: (){

                      },
                      Controller:textController ,
                      Lable: 'Search',
                      Validat: 'can not be empty',
                      PrefixIcon: Icons.search,
                      KeyboardType: TextInputType.name,
                      OnChange: (value){
                        cubit.getNewsSearch(value);
                        value=textController.text;
                      }
                  ),
                ),
                Expanded(child: ListView.separated(
                    separatorBuilder: (context,index)=>const SizedBox(height: 2,),
                    itemCount:cubit.newsSearch.length,
                    itemBuilder: (context,index)=>textController.text.isEmpty?Container():buildItemList(cubit.newsSearch[index], context)) ,
                    )
              ],
            )
        );
      },

    );
  }
}
