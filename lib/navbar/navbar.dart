import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/navbar/navgetorpages/aboutusnav.dart';
import 'navgetorpages/adminnav.dart';
import 'navgetorpages/motawanav.dart';

class navbar extends StatelessWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children:[
          DrawerHeader(
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage('images/sadaka.jpeg'),
                  fit: BoxFit.cover)),
          child:Text('')),
          SizedBox(height: 30,),
          Divider(color: Colors.black,),
          ListTile(
            leading: Icon(Icons.person_add,color: Colors.black,),
            title: Text("متطوع",style:GoogleFonts.amiri(fontSize: 25,color:Colors.black)),
            onTap: (){Navigator.push(context,
                MaterialPageRoute(builder:(context)=> Montataw()));},
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.person,color: Colors.black,),
            title: Text("أدمن",style:GoogleFonts.amiri(fontSize: 25,color:Colors.black)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=> AdminNav()));
            },
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.flag_circle,color: Colors.black,),
            title: Text("About Us",style:GoogleFonts.amiri(fontSize: 25,color:Colors.black)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=> AboutUs()));
            },
          ),
          Divider(color: Colors.black),

        ],
      ),

    );
  }
}
