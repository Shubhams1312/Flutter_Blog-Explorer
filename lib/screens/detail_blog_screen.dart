import 'package:flutter/material.dart';

class DetailedBlockedScreen extends StatelessWidget {
  // const DetailedBlockedScreen({super.key});

  String? id;
  String? image;
  String? title;

  DetailedBlockedScreen({this.id , this.image,this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed Box Screen"),
      ),

      body: Padding(
                                        padding: const EdgeInsets.all(15), 
                                        child:  Container(
                                          height: MediaQuery.of(context).size.height / 2,
                                          padding: EdgeInsets.all(2),
                                           decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)
                                           ),
                                           child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(image! ,
                          height:MediaQuery.of(context).size.height*0.4 ,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          ),
                          
                        ),
                        SizedBox(height: 20,),
                        Text(title!, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                           ],
                                           ),
                                        ),
                                        ),
    );
  }
}