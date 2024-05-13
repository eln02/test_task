import 'package:flutter/material.dart';
import 'package:test_task/search_page/presentation/widgets/search_widget3.dart';
import 'package:test_task/search_page/presentation/widgets/filters_widgets/ticket_filters.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import '../../../shared/widgets/alert_dialog.dart';
import '../../../shared/widgets/navigation.dart';
import '../../../tickets_page/presentation/pages/tickets_page.dart';
import '../widgets/tickets_offers_widget.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        onClicked: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
      backgroundColor: Theme.of(context).appColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 47,
                ),
                const SearchWidget3(),
                const SizedBox(height: 13,),
                const TicketFilters(),
                const SizedBox(
                  height: 32,
                ),
                TicketsOffersWidget(),
                const SizedBox(height: 23,),
                _button(context),
                const SizedBox(height: 24,),
                //_priceSubscription(context)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _button(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 42,
      child: ElevatedButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const TicketsPage()));},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).appColors.blue),
          elevation: MaterialStateProperty.all<double>(0), 
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), 
            ),
          ),
        ),
        child: Text(
          'Посмотреть все билеты',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}







