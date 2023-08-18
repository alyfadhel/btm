import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review123/cubit/state.dart';
import 'package:review123/layout/category/category_screen.dart';
import 'package:review123/layout/favorite/favorite_screen.dart';
import 'package:review123/layout/home/home_screen.dart';
import 'package:review123/layout/settings/settings_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.category_outlined,
      ),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border,
      ),
      label: 'Favorite',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'settings'),
  ];
  List<Widget>screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Category',
    'Favorite',
    'settings',
  ];

  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNav());
  }
}
