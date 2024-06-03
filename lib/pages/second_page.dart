import 'package:community_app/model/data_user_model.dart';
import 'package:community_app/pages/third_page.dart';
import 'package:community_app/service/user_service.dart';
import 'package:flutter/material.dart';
List<DataUser> result =[];
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
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            Text('Invite Friends',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            Icon(Icons.delete,color: Colors.white,)
            ],),
        ),
        FutureBuilder(future: UserServiceImp().getData(),
         builder:((context, snapshot) {
            if(snapshot.hasData){
             List<DataUser> data =snapshot.data as List<DataUser>;
             result = data;
             return StatefulBuilder(
              builder :(context,refrech){

              
               return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      onChanged: (value){
                        result=[];
                        refrech((){
                          data.forEach((element) { 
                            if(element.name.contains(value)){
                              result.add(element);
                            }
                          });
                        });

                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        suffixIcon: Icon(Icons.mic,color: Colors.white,),
                        labelText: 'search here',),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                    
                      itemCount: result.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          
                          leading: CircleAvatar(
                            backgroundImage:NetworkImage(snapshot.data![index].image),
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
                                  child: Text(snapshot.data![index].unread_message_count.toString(),
                                  style: TextStyle(color: Colors.white),
                                
                                  )),
                              )
                            ],
                          ),
                          subtitle: Text(snapshot.data![index].message,style: TextStyle(color: Colors.white)),
                          trailing: Text(snapshot.data![index].date),
               
                        );
                      }),
                      
                  )
                ],
                     
               );}
             );
             }
             
      
      
      
             
                       
        
        else{

      return CircularProgressIndicator();}}
        
        ))],),
    );
  }
}
