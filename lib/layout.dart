import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review123/cubit/cubit.dart';
import 'package:review123/cubit/state.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BottomAppBar(
                notchMargin: 8.0,
                height: 105,
                color: Colors.red,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const CircularNotchedRectangle(),
                padding: EdgeInsets.zero,
                child: BottomNavigationBar(
                  items: cubit.items,
                  backgroundColor: Colors.red,
                  type: BottomNavigationBarType.fixed,
                  unselectedIconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNav(index);
                  },
                  iconSize: 30.0,
                ),
              ),
            ),
            floatingActionButton: SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
