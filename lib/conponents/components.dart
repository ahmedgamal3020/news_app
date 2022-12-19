
import 'package:flutter/material.dart';
import 'package:new_news/modules/Screens/web_view_screen.dart';

//List Item From API
Widget buildItemList(ar,context)=> InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(url:ar['url'],));
  },
  child:Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image:NetworkImage('${ar['urlToImage'] ??
                        'https://camo.githubusercontent.com/62f7147b015014d86f38098373baccc2b542d6301dc12b40df69ea85db35bf2c/68747470733a2f2f73636f74742e65652f696d616765732f6e756c6c2e706e67' }'),
                  fit: BoxFit.cover
                )
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${ar['title']}',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyText1
                      ),
                    ),
                    Text('${ar['publishedAt']}',
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),
            ),
          ],

        )

      ],



    ),
  ),
);

//scroll the items
Widget buildListOFItems(
    @required int ittemCount,
    @required Widget separator,
    @required Widget Items(index)
    )=>ListView.separated(
    physics:const BouncingScrollPhysics() ,
    itemCount:ittemCount,
    separatorBuilder: (context,index)=>separator,
    itemBuilder: (context,index)=>Items(index)

);

Widget defaultTextFromField(
        {OnChange,
        String? Validat,
        @required String? Lable,
        KeyboardType,
        @required IconData? PrefixIcon,
        Controller,
        ontap}) =>
    TextFormField(
      onTap: ontap,
      controller: Controller,
   keyboardType: KeyboardType,
  onChanged:OnChange,
  validator:(String? value)
  {
    if(value!.isEmpty){
      return Validat;
    }
    return null;
  } ,
  decoration: InputDecoration(
    label:Text(Lable!),
    prefixIcon: Icon(PrefixIcon),
    border: const OutlineInputBorder()


  ) ,
);

Future navigateTo(context,route)=>Navigator.push(context,
    MaterialPageRoute(builder:(context) => route));