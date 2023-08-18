import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review123/cubit/cubit.dart';
import 'package:review123/cubit/state.dart';
import 'package:review123/layout/info/info_screen.dart';

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
            appBar: AppBar(
              title:
                Text(cubit.titles[cubit.currentIndex])
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: BottomAppBar(
              notchMargin: 8,
              height: 105,
              elevation: 0.0,
              //color: Colors.yellow,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const CircularNotchedRectangle(),
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: BottomNavigationBar(
                    items: cubit.items,
                    backgroundColor: Colors.teal,
                    type: BottomNavigationBarType.fixed,
                    unselectedIconTheme: const IconThemeData(
                      color: Colors.yellow,
                    ),
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.yellow,
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomNav(index);
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
            ),
            floatingActionButton: SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(),
                    ),
                  );
                },
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: const Icon(
                  Icons.pages,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
