import 'package:flutter/material.dart';
import 'package:startup_namer/shared/components/constants.dart';

import '../../shared/components/components.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context ,index)=> buildTaskItem(tasks[index]),
        separatorBuilder: (context , index)=>Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
    );
  }
}
