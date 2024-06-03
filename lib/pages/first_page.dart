
import 'package:community_app/pages/second_page.dart';
import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     
     const Row(
       mainAxisAlignment: MainAxisAlignment.center,
            
       children: [
        
        
         Text('r',style: TextStyle(color: Colors.white,fontSize: 30)),
         Text('ii',style: TextStyle(color: Color(0xff4CE5B1
),fontSize: 30)),
           Text('de',style: TextStyle(color: Colors.white,fontSize: 30)),
              
         ],),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('Welcome to RIIDE',style: TextStyle(color: Colors.white,fontSize: 30),),
         ),
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: Align(
            alignment: Alignment.topLeft,
            child: Text('USERNAME',style: TextStyle(color: Colors.white),)),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
            
            decoration: InputDecoration(
              labelText: 'Enter email or username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
           
           ),
         ),
         const Padding(
           padding:  EdgeInsets.all(8.0),
           child: Align(
            alignment: Alignment.topLeft,
            child: Text('PASSWORD',style: TextStyle(color: Colors.white),)),
         ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: TextFormField(
            
            decoration: InputDecoration(
              labelText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
           
           ),
         ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text('Remember me',style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text('FOrget password',style: TextStyle(color: Colors.blue),),
            )
            ],),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Container(width: 480,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15)),
                child: Center(child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
                  },
                  child:  const Text('Sign In',style: TextStyle(color: Colors.white),))),
              ),
            ),
           const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account ?',style: TextStyle(color: Colors.white),),
                  Text('Sign up',style: TextStyle(color: Colors.blue),)
                ],
              ),
            ),

    ],)
    ;
  }
}
