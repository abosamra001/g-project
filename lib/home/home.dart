import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/navbar/navbar.dart';
import 'navgetorpages/montnav.dart';
import 'navgetorpages/motabranav.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: navbar(),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text("تبرع",style:GoogleFonts.amiri(fontSize: 30,color:Colors.black) ,),
      ),
      body:Stack(
        children:[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/home.jpeg'),
                      fit: BoxFit.cover)
              )
          ),
          SingleChildScrollView(
    padding: const EdgeInsets.all(30),
         child: Center(
        child: Column(
        children: [
          Container(
            child: Text('لَن تَنَالُوا۟ ٱلْبِرَّ حَتَّىٰ تُنفِقُوا۟ مِمَّا تُحِبُّونَ وَمَا تُنفِقُوا۟ مِن شَىْءٍ فَإِنَّ ٱللَّهَ بِهِۦ عَلِيمٌ (آل عمران) '
                ,style:GoogleFonts.amiri(fontSize: 25,color:Colors.black,fontWeight:FontWeight.bold)),
          ),
          SizedBox(height: 40,),
          ElevatedButton(
              onPressed:(){Navigator.push(context,
              MaterialPageRoute(builder:(context)=> Motabra()));},

            child:Text("المٌنتفع",style:GoogleFonts.amiri(fontSize: 30,color:Colors.black)),
         style:ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade50 ,
             padding: const EdgeInsets.all(16.0),
            shadowColor: Colors.black,
           minimumSize: Size(140, 70)
         )),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder:(context)=> montnav()));
          },
              child:Text("المُتبرع",style:GoogleFonts.amiri(fontSize: 30,color:Colors.black)),
              style:ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade50 ,
                  padding: const EdgeInsets.all(16.0),
                  shadowColor: Colors.black,
                  minimumSize: Size(140, 70)
              )),
        ]
        ),
    )


    ),

      ])

    );
  }
}
