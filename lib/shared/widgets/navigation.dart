import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/shared/config/theme/colors.dart';


class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onClicked;

  const BottomNavigation({super.key, required this.selectedIndex, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _icon(context, 'assets/plane3.svg', 0),
          label: 'Авиабилеты',
        ),
        BottomNavigationBarItem(
          icon: _icon(context, 'assets/bad.svg', 1),
          label: 'Отели',
        ),
        BottomNavigationBarItem(
          icon: _icon(context, 'assets/geo.svg', 2),
          label: 'Короче',
        ),
        BottomNavigationBarItem(
          icon: _icon(context, 'assets/bell.svg', 3),
          label: 'Подписки',
        ),
        BottomNavigationBarItem(
          icon: _icon(context, 'assets/person2.svg', 4),
          label: 'Профиль',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
      selectedItemColor: Theme.of(context).appColors.blue,
      backgroundColor: Theme.of(context).appColors.black,
      unselectedItemColor: Theme.of(context).appColors.grey6,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 10, inherit: true),
      unselectedLabelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 10, inherit: true),

    );
  }

  Widget _icon(BuildContext context, String path, int index){
    Color color = index == selectedIndex ? Theme.of(context).appColors.blue :  Theme.of(context).appColors.grey6;
    return Column(
      children: [
        SvgPicture.asset(
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          path,
          fit: BoxFit.scaleDown,
        ),
      ],
    );
  }
}
