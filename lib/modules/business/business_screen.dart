import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/layout/news_app/cubit/cubit.dart';
import 'package:startup_namer/layout/news_app/cubit/states.dart';
import 'package:startup_namer/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state ) {
          var list = NewsCubit.get(context).business;
          return list.length < 0
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      buildArticleItem(list[index],context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: list.length,
                  physics: const BouncingScrollPhysics(),
                );
        },
        listener: (context, state) {});
  }
}
