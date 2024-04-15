import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/plantList.dart';
import 'package:plant_app/models/plantModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

      List<PlantModel>plants = plantsList.map((e) =>
    PlantModel(name: e['name'], quantity: e['quantity'], image: e['image'])).toList();
    return  Scaffold(
appBar: AppBar(
  leading: const Icon(Icons.settings,size: 30,color: Colors.grey,),
    actions:   [
   Padding(
     padding: EdgeInsets.only(right: 10),
     child: CircleAvatar(
       backgroundColor: Colors.grey.withOpacity(0.3),
      child: Icon(Icons.add,weight: 10,color: Colors.white,),
     ),
   )
  ],
),
      body: Container(
        margin: const EdgeInsets.all(20),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Water Today",
            style: TextStyle(
              fontSize: 22, 
              fontWeight: FontWeight.w600
            ),),
 const SizedBox(height: 10,),
 Expanded(
   child: ListView.separated(
       itemBuilder: (context,index){
         return Container(
           margin: const EdgeInsets.only(bottom: 10),
           height: 120,
               width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)
              ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image.network(plants[index].image,
               height: 100,
               width: 100,),
              Padding(
                padding: const EdgeInsets.only(left: 50,top: 10),
                child: Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child:
                      Text(plants[index].name.toString(),
                      style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600),)
                      ),
                      Row(
                        children: [
                          const Icon(Icons.water_drop,color: Colors.black,),
                          SizedBox(width: 5,),
                          Text(plants[index].quantity.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: CircleAvatar(
                   backgroundColor: Colors.white,
                   radius: 25,
                   child: Icon(Icons.water_drop,
                   color: Colors.primaries[Random().nextInt(plants.length)].withOpacity(0.4),),
                 ),
               )
             ],
           ),
             );
   
   
       },
       separatorBuilder: (context,index){
         if(index == 3){
           return const Text("Date",
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w700
           ),);
         }
        else return Container();

       },
       itemCount: plants.length),
 )
          ],
        ),
      ),
    );
  }
}
