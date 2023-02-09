import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 110,
          ),
          SizedBox(
            height: size.height / 2.5,
              child: Image.asset("assets/save-time.png",),),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Time Saving",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

         const SizedBox(
           height: 30,
         ),
         const Padding(
           padding: EdgeInsets.symmetric(horizontal: 20),
           child: Center(
                child: Text(
                  "Maximize productivity by avoiding time-wasting activities. Focus on the tasks that bring value and bring you closer to your goals"
                ),
            ),
         ),
        ],
      ),
    );
  }
}
