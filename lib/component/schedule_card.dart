import 'package:flutter/material.dart';

import '../const/color.dart';


class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;

  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                      '${startTime.toString().padLeft(2,'2')}:00',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      '${endTime.toString().padLeft(2,'0')}:00',
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
                        content
                    ),
                  )
              ),
              SizedBox(width: 16.0,),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color
                ),
                width: 16.0,
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
