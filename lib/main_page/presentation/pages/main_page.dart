import 'package:flutter/material.dart';
import 'package:test_task/shared/widgets/alert_dialog.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import 'package:test_task/shared/widgets/navigation.dart';
import 'package:test_task/main_page/presentation/widgets/widgets_for_page/search_widget.dart';
import '../widgets/widgets_for_page/offers.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 0){
        showAlert(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onClicked: _onItemTapped,
      ),
      backgroundColor: Theme.of(context).appColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 28,),
              _text(context),
              const SizedBox(height: 36,),
              const SearchWidget(),
              const SizedBox(height: 32,),
              OffersWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(BuildContext context){
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Поиск дешевых\n",
          style: Theme.of(context).textTheme.displayLarge,
          children: <TextSpan>[
            TextSpan(
              text: "авиабилетов",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
