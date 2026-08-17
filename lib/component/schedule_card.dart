import 'package:flutter/material.dart';

import '../const/color.dart';


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                  width: 4.0,
                ),
                borderRadius: BorderRadius.circular(16.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '11:00',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            '12:00',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0,),
                    Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Text(
                              '플러터 앱 개발하기'
                          ),
                        )
                    ),
                    SizedBox(width: 16.0,),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red
                      ),
                      width: 16.0,
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
