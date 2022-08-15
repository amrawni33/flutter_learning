import 'package:flutter/material.dart';
import 'package:startup_namer/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUperCase = true,
  @required String? text,
  @required Function()? function,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUperCase ? (text ?? 'login').toUpperCase() : (text ?? 'login'),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

/// **************************************************************************/
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  Function()? suffixPressed,
  bool isPassword = false,
  String? labelText,
  IconData? prefix,
  IconData? suffix,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPassword,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText ?? 'Email Address',
        prefixIcon: Icon(prefix ?? Icons.email),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );

///****************************************************************************/
Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'done', id: model['id']);
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'archive', id: model['id']);
              },
              icon: Icon(
                Icons.archive_outlined,
                color: Colors.grey[700],
              ),
            )
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );
