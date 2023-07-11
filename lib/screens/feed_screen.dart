import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nisipet/screens/login_screen.dart';
import '../utils/colors.dart';
import '../utils/global_variable.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'NisiPet',
                    style: TextStyle(
                      color: Color(
                        0xFFffb247
                      ),
                      fontSize: 25
                    ),
                  ),
                  elevation: 0,
                  /*leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFffb247),
                    ),
                  ),*/
                ),
                body: Material(
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: double.infinity,
                    //color: Color(0xFFffb247).withOpacity(0.8),
                    /*decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0x66ffb247),
                              Color(0x99ffb247),
                              //Color(0xCCffb247),
                              //Color(0xFFffb247),
                            ])
                    ),*/
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) => Container(
                            /*margin: EdgeInsets.symmetric(
                              horizontal: width > webScreenSize ? width * 0.3 : 0,
                              vertical: width > webScreenSize ? 15 : 0,
                            ),*/
                            child: PostCard(
                              snap: snapshot.data!.docs[index].data(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
  }
}