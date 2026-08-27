import 'package:flutter/material.dart';

import '../const/color.dart';
import 'custom_text_field.dart';

class Schedulebottomsheett extends StatefulWidget {
  const Schedulebottomsheett({super.key});

  @override
  State<Schedulebottomsheett> createState() => _SchedulebottomsheettState();
}

class _SchedulebottomsheettState extends State<Schedulebottomsheett> {

  String selectedColor=categoryColors.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 400,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0, top: 16.0),
          child: Column(
            children: [
              _Time(),
              SizedBox(height: 16.0,),
              _Contents(),
              SizedBox(height: 16.0,),
              _Categories(
                selectedColor: selectedColor,
                onTap: (String color){
                  //print('onTap');
                  setState(() {
                    selectedColor=color;
                  });
                },
              ),
              SizedBox(height: 8.0,),
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}






class _Time extends StatelessWidget {
  const _Time({super.key});

  @override
  Widget build(BuildContext context) {
    return               Row(
      children: [
        Expanded(
            child: CustomTextField(
              label: '시작시간',
            )
        ),
        SizedBox(width: 16.0,),
        Expanded(
            child: CustomTextField(
                label: '종료시간'
            )
        ),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  const _Contents({super.key});

  @override
  Widget build(BuildContext context) {
    return               Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true,
      ),
    );
  }
}

typedef OnColorSelected = void Function(String color);

class _Categories extends StatelessWidget {

  final String selectedColor;
  final OnColorSelected onTap;

  const _Categories({
    super.key,
    required this.selectedColor,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return               Row(
      children: categoryColors.map(
              (e)=> Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: (){
                onTap(e);
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(
                        int.parse(
                            'FF$e',
                            radix: 16
                        )
                    ),
                  border: e==selectedColor ? Border.all(
                    color: Colors.black,
                    width: 4.0
                  ) : null,
                ),
                width: 32.0,
                height: 32.0,
              ),
            ),
          )
      ).toList(),
    );
  }
}


class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return               Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
              ),
              onPressed: (){},
              child: Text(
                  '저장'
              )

          ),
        ),
      ],
    );
  }
}
