import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../responsive/mobile_screen_layout.dart';
import 'AddContactScreen.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {

  late Query _ref;
  /*void call(String text)async{
    bool? res = await FlutterPhoneDirectCaller.callNumber(text);
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference()
        .child('Contact')
        .orderByChild('name');
  }

  Widget _buildContactItem({required Map<dynamic,dynamic> contact}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Color(0xFFffb247),
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['name'],
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFffb247),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: Color(0xFFffb247),
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['number'],
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFffb247),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40,width: 100,),
              IconButton(
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber(contact['number']);
                    // launch(('tel://${contact['number']}'));
                  },
                  icon: Icon(Icons.phone,
                    color: Color(0xFFffb247),)
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Call Page',
          style: TextStyle(
            color: Color(0xFFffb247),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MobileScreenLayout()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFffb247),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (
              BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
            Map contacts = snapshot.value as Map;
            return _buildContactItem(contact: contacts);
          },
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return AddContactScreen();
          }));
        },
        child: Icon(
          Icons.add,
          color: Color(0xFFffb247),
        ),
      ),*/
    );
  }
}
























/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summerproject_nisipet/Addcontacts.dart';

class CallPage extends StatefulWidget {
  // const CallPage({Key? key}) : super(key: key);
  CallPage({required String title});

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  late Query _ref;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference()
    .child('Contacts')
    .orderByChild('name');
  }

  Widget _buildContactItem({required Map contact}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      color:  Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person,
                color: Colors.amber,
                size: 20,
              ),
            ],
          ),
          SizedBox(width: 6,),
          Text(contact['name'],style: TextStyle(fontSize: 16,
          color: Colors.amber,
          fontWeight: FontWeight.w600),),
        ],
      ),
    );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Contacts',style: TextStyle(color: Color(0xFFffb247)),),
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(
                Icons.arrow_back_ios,
            color: Color(0xFFffb247),)),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder:(BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
            Map contact = snapshot.value as Map;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
      floatingActionButton:  FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return Addcontacts();
        }));
      },
        child: Icon(Icons.add,color: Colors.amber,),
      ),
    );
  }
}*/