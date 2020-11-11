import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return    Column(children: [
              Padding(padding: EdgeInsets.symmetric(horizontal:20),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                Text('Top Destinations',
                style: TextStyle( 
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),),
                GestureDetector(
                  onTap: () => print('see all'),
                                  child: Text('See All',
                  style: TextStyle( 
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),),
                ),
              ],),
              ),
              Container( 
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index){ 
                    Destination destination = destinations[index];
                    return  Container( 
                      margin: EdgeInsets.all(10),
                      width: 210,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                        Positioned(
                          bottom:0.0,
                         child: Container( 
                           width: 200,
                           height: 120,
                           decoration: BoxDecoration( 
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                               Text('${destination.activities.length}activities',
                               style: TextStyle(
                                 fontSize: 22,
                                 fontWeight: FontWeight.w600,
                                 letterSpacing: 1.2,
                               ),),
                               Text(destination.description, style: TextStyle(
                                 color: Colors.grey
                               )),
                             ],),
                           ),
                          ),
                        ),
                        Container( 
                          decoration: BoxDecoration( 
                             color: Colors.white,
                          borderRadius:BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.black26,
                              offset: Offset(0.0,2.0),
                              blurRadius: 6.0,
                             )
                            
                          ]
                          ),
                         child: Stack(children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(20),
                               child: Image(
                               height: 180,
                               width: 180,
                               image: AssetImage(destination.imageUrl),
                               fit: BoxFit.cover,
                             ),
                           ),
                           Positioned(
                             left: 10,
                             bottom: 10,
                                                        child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                               Text(destination.city,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 24,
                                 fontWeight: FontWeight.w600,
                                 letterSpacing: 1.2,
                               ),),
                               Row(
                                 children: [
                                   Icon(
                                     FontAwesomeIcons.locationArrow,
                                     size: 10,
                                     color: Colors.white,
                                   ),
                                   SizedBox(height: 10,),
                                    Text(destination.country,
                                  style: TextStyle(
                                   color: Colors.white,
                                 ),),
                                 ],
                               ),
                             ],),
                           )
                         ],),
                        )
                      ],),
                    );
                  }
                  ),
              )
            ],);
  }
}