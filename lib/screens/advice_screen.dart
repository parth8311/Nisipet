import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nisipet/responsive/mobile_screen_layout.dart';
import 'package:nisipet/screens/feed_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvicePage extends StatefulWidget {
  //const AdvicePage({Key? key, required String title}) : super(key: key);
  const AdvicePage({Key? key}) : super(key: key);
  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {

  var titleList = [
    "ARTHRITIS",
    "BLOAT & GASTRIC TORSION",
    "CANCER",
    "CANINE PARVOVIRUS",
    "OBESITY",

  ];

  var decList = [
    "Arthritis is an inflammation of any joint in the body. The inflammation can have many causes. The most common type of arthritis is osteoarthritis which can be due to wear and tear on joints from over use, aging, injury, or from an unstable joint such as which occurs with a ruptured ACL (anterior cruciate ligament) in the knee.",
    "Bloat & Gastric Torsion is a serious condition and your pet should be rushed to the emergency room if this occurs. Certain breeds of dogs with deep chests and narrow waists, such as hounds, Bouvier des Flandres, or Doberman Pinschers are more susceptible to a syndrome of gastric torsion and bloat.",
    "Cancer definition is the uncontrolled growth of cells. Any type of cells in the body can become cancerous. Once these cells grow out of control, they take over areas previously occupied by normal cells; sometimes these tumor cells break off and travel to other areas of the body.",
    "The virus is released into the environment from infected puppies when they have a bowel movement. When unprotected dogs come into contact with the feces (stool), infection occurs when the virus is ingested. All dogs are at risk, but unvaccinated puppies are particularly susceptible to infection.",
    "Excess weight is a serious health problem for dogs and cats and is common in many countries. The two main causes of obesity are too much food and too little exercise. Other contributing factors can be due to hormonal influences, certain genetic factors, and other disease processes.",
  ];

  var imgList = [
    "assets/images/ARTHRITIS.jpeg",
    "assets/images/BLOAT & GASTRIC TORSION.jpeg",
    "assets/images/CANCER.jpeg",
    "assets/images/CANINE PARVOVIRUS.jpeg",
    "assets/images/OBESITY.jpeg",
  ];

  var linkList = [
    "https://www.ardmoreah.com/pet-care/common-pet-health-issues/arthritis/",
    "https://www.ardmoreah.com/pet-care/common-pet-health-issues/bloat-gastric-torsion/",
    "https://www.ardmoreah.com/pet-care/common-pet-health-issues/cancer-in-animals/",
    "https://www.ardmoreah.com/pet-care/common-pet-health-issues/canine-parvovirus/",
    "https://www.ardmoreah.com/pet-care/common-pet-health-issues/obesity/",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width*0.6;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MobileScreenLayout()));
          },icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xFFffb247),
        ),
        ),
        title: Text(
          "Advice Page",
          style: TextStyle(color: Color(0xFFffb247)),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index){
                return InkWell(
                  /*onTap: (){
                    showDialogFunc(context, imgList[index],titleList[index],decList[index]);
                  },*/
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      Material(
                        child: Container(
                          color: Colors.black,
                          alignment: Alignment.center,
                          /*decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0x66ffb247),
                                    Color(0x99ffb247),
                                  ]
                              )
                          ),*/
                          child: Card(
                              child: Container(
                                color: Colors.black,
                                alignment: Alignment.center,
                                /*decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0x66ffb247),
                                          Color(0x99ffb247),
                                        ]
                                    )
                                ),*/
                                child: Row(
                                  children: <Widget>[
                                    Material(
                                      child: Container(
                                        color: Colors.black,
                                        alignment: Alignment.center,
                                        /*decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0x66ffb247),
                                                  Color(0x99ffb247),
                                                ]
                                            )
                                        ),*/
                                        //color: Colors.black,
                                        width: 100,
                                        height: 200,
                                        child: Image.asset(imgList[index]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            titleList[index],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFFffb247),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            width: width,
                                            child: Text(
                                              decList[index],
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFffb247)
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          Container(
                                            child: new InkWell(
                                              child: new Text("For More Information",
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                fontSize: 12,
                                                color: Color(0xFFffb247)
                                              ),),
                                              onTap: () => launch(linkList[index]),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        );
  }
}

showDialogFunc(context,img,title,des)
{
  return showDialog(
      context: context,
      builder: (context)
      {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body : Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(img,
                        width: 200,
                        height: 300),
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    des,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      }
  );
}