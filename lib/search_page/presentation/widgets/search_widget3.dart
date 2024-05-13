import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/config/theme/colors.dart';

import '../../../shared/shared_state/from_notifier.dart';
import '../../../shared/shared_state/to_notifier.dart';
import '../../../shared/widgets/text_field.dart';



class SearchWidget3 extends StatefulWidget {
  const SearchWidget3({super.key});

  @override
  _SearchWidget3State createState() => _SearchWidget3State();
}

class _SearchWidget3State extends State<SearchWidget3> {
  late TextEditingController fromController;
  late TextEditingController toController;

  @override
  void initState() {
    super.initState();
    fromController = TextEditingController(text: Provider.of<FromNotifier>(context, listen: false).from);
    toController = TextEditingController(text: Provider.of<ToNotifier>(context, listen: false).to);
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
      width: MediaQuery.of(context).size.width,
      height: 97,
      padding: const EdgeInsets.only(right: 16, left: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).appColors.grey3,
      ),
      child: Row(
        children: [
          _arrowLeft(context),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: CustomTextField(
                          controller: fromController,
                          hintText: 'Откуда - Москва',
                          onChanged: (value) {
                            Provider.of<FromNotifier>(context, listen: false).set(value);
                          },
                        ),
                      ),
                    ),
                    _arrows(context),
                  ],
                ),
                Divider(color: Theme.of(context).appColors.grey4, thickness: 1, height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: Consumer<ToNotifier>(
                            builder: (context, textModel, child) {
                              return CustomTextField(
                                hintText: 'Куда - Турция',
                                padding: 6,
                                controller: toController,
                                onChanged: (value) {
                                  textModel.set(value);
                                },
                              );
                            }
                        ),
                      ),
                    ),
                    _cross(context)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cross(BuildContext context){
    return InkWell(
      onTap: () {toController.text = '';},
      child: SizedBox(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(Theme.of(context).appColors.grey6, BlendMode.srcIn),
          'assets/cross.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _arrows(BuildContext context){
    return InkWell(
      onTap: () {
        String temp = fromController.text;
        fromController.text = toController.text;
        toController.text = temp;
      },
      child: SizedBox(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(Theme.of(context).appColors.grey6, BlendMode.srcIn),
          'assets/arrows.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _arrowLeft(BuildContext context){
    return InkWell(
      onTap: (){Navigator.pop(context);},
      child: SizedBox(
        height: 24,
        width: 24,
        child: SvgPicture.asset(
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(Theme.of(context).appColors.grey6, BlendMode.srcIn),
          'assets/arrow_left.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

