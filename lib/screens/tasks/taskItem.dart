import 'package:flutter/material.dart';
import 'package:todo/shared/stayles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 352,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Play basket ball',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      SizedBox(
                        width: 4,
                      ),
                      Text('10:30 AM')
                    ],
                  )
                ],
              ),
              Spacer(),
              Container(
                  width: 69,
                  height: 34,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.done, color: Colors.white, size: 30))
            ],
          ),
        ),
      ),
    );
  }
}
