import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import '../../../shared/widgets/alert_dialog.dart';
import '../../../shared/shared_state/date_notifier.dart';
import '../../../shared/shared_state/from_notifier.dart';
import '../../../shared/shared_state/to_notifier.dart';
import '../../../shared/widgets/navigation.dart';
import '../widgets/tickets.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 0) {
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
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Theme.of(context).appColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                _topContainer(context),
                const SizedBox(
                  height: 18,
                ),
                TicketCardListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topContainer(BuildContext context) {
    String from = Provider.of<FromNotifier>(context, listen: false).from;
    String to = Provider.of<ToNotifier>(context, listen: false).to;
    String date =
        Provider.of<DateNotifier>(context, listen: false).getFullDate();
    return Container(
      color: Theme.of(context).appColors.grey2,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).appColors.blue, BlendMode.srcIn),
                'assets/arrow_left.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$from-$to',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "$date, 1 пассажир",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).appColors.grey6),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 78, vertical: 70),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 37,
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).appColors.white, BlendMode.srcIn),
                  'assets/settings.svg',
                  fit: BoxFit.scaleDown,
                ),
                Text(
                  "Фильтр",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).appColors.white, BlendMode.srcIn),
                  'assets/graph.svg',
                  fit: BoxFit.scaleDown,
                ),
                Text(
                  "График цен",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ],
        ));
  }
}
