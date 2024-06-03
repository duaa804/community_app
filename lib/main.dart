import 'package:community_app/model/data_user_model.dart';
import 'package:community_app/service/user_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomePage(),);

  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body:WelcomePage(),
      // 
       );
  }
}
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
         Text('ii',style: TextStyle(color: Colors.green,fontSize: 30)),
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
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        
        children: 
      [
        Padding(
          padding: const EdgeInsets.all(60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
           [
            InkWell(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdPage()));
              },
              child: Icon(Icons.arrow_back,color: Colors.white,)),
            Text('Invite Friends',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            Icon(Icons.delete,color: Colors.white,)
            ],),
        ),
        FutureBuilder(future: UserServiceImp().getData(),
         builder:((context, snapshot) {
            if(snapshot.hasData){
             List<DataUser> data =snapshot.data as List<DataUser>;
             return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      suffix: Icon(Icons.search,color: Colors.white,),
                      prefix: Icon(Icons.record_voice_over,color: Colors.white,),
                      labelText: 'search here',),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                  
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        
                        leading: CircleAvatar(
                          child: Image.network(snapshot.data![index].image),
                        ),

                        title:Row(
                          children: [
                            Text(snapshot.data![index].name,style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle),
                                child: Text(snapshot.data![index].unread_message_count.toString(),style: TextStyle(color: Colors.white),)),
                            )
                          ],
                        ),
                        subtitle: Text(snapshot.data![index].message,style: TextStyle(color: Colors.white)),
                        trailing: Text(snapshot.data![index].date),

                      );
                    }),
                    
                )
              ],
      
             );
             }
             
      
      
      
             
                       
        
        else{
      return CircularProgressIndicator();}}
        
        ))],),
    );
  }
}

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
            Icon(Icons.arrow_back,color: Colors.white,),
            Text('Invite Friends',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            Icon(Icons.delete,color: Colors.white,)
            ],),),
          
            Image.asset('assets/cado.png'),
      
            Text('Invite Friends',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
            Text("Sign up a friend with your referral \n code and earn \$RIIDE and/or free rides.",style:TextStyle(color:Colors.white)),
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