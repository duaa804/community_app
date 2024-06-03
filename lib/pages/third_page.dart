import 'package:community_app/pages/second_page.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
           Padding(
          padding: const EdgeInsets.all(60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
           [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            Text('Invite Friends',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            Icon(Icons.delete,color: Colors.white,)
            ],),),
          
            Image.asset('assets/cado.png'),
      
            Text('Invite Friends',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sign up a friend with your referral \n code and earn \$RIIDE and/or free rides.",style:TextStyle(color:Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 324,
                decoration: BoxDecoration(
                  color: Color(0xffbac161616),
              
                  borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('share your invit code',style: TextStyle(color:Color(0xffC5C5CF
              ))),
                  ),
                  ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 324,
                decoration: BoxDecoration(
                  color: Color(0xff4CE5B1
      ),
              
                  borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('invite friends',style: TextStyle(color:Colors.white
                                  )),
                    )),
                  ),
                  ),
            
                
                
        ],
      ),
    );
  }
}