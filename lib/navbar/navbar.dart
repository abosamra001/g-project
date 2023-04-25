import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add,color: Colors.black,),
            title: Text("متطوع",style:GoogleFonts.amiri(fontSize: 25,color:Colors.black)),
            onTap: ()=> null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person,color: Colors.black,),
            title: Text("أدمن",style:GoogleFonts.amiri(fontSize: 25,color:Colors.black)),
            onTap: ()=> null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.flag_circle,color: Colors.black,),
            title: Text("About Us",style:GoogleFonts.amiri(fontSize: 25,color:Colors.black)),
            onTap: ()=> null,
          ),
          Divider(),

        ],
      ),

    );
  }
}
