import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/config/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/shared/shared_state/from_notifier.dart';
import 'package:test_task/shared/widgets/text_field.dart';

import '../../pages/modal_window.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  String _savedValue = '';

  @override
  void initState() {
    super.initState();
    _loadSavedValue();
  }

  Future<void> _loadSavedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedValue = prefs.getString('lastInput') ?? '';
      fromController.text = _savedValue;
    });
  }

  Future<void> _saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastInput', fromController.text);
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: 122,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).appColors.grey3,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 16),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).appColors.grey4,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).appColors.grey6, BlendMode.srcIn),
              'assets/search.svg',
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 44,
                    child: CustomTextField(
                      controller: fromController,
                      hintText: 'Откуда - Москва',
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).appColors.grey5,
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 44,
                    child: CustomTextField(
                      controller: toController,
                      hintText: 'Куда - Турция',
                      padding: 14,
                      onTap: () {
                        _saveValue();
                        showMyModalBottomSheet(context);
                        Provider.of<FromNotifier>(context, listen: false)
                            .set(fromController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
