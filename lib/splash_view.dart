import 'package:flutter/material.dart';
import 'package:mike_list/onboarding_parent.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      const Spacer(),
       const Center(child: Text("singlist", style: TextStyle(fontSize: 50, color: Colors.white, decoration: TextDecoration.none),),),
      const Spacer(),
      ElevatedButton(onPressed: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnboardingparentView()), (Route<dynamic> route) => false);
      }, child: const Text("go")),
      const Padding(padding: EdgeInsets.all(60)),
      
    ],);
    
  }
}