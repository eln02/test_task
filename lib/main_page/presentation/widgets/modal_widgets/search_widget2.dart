import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/config/theme/colors.dart';

import '../../../../shared/shared_state/from_notifier.dart';
import '../../../../shared/shared_state/to_notifier.dart';
import '../../../../shared/widgets/text_field.dart';

class SearchWidget2 extends StatefulWidget {
  const SearchWidget2({super.key});

  @override
  _SearchWidget2State createState() => _SearchWidget2State();
}

class _SearchWidget2State extends State<SearchWidget2> {
  late TextEditingController fromController = TextEditingController();
  late TextEditingController toController = TextEditingController();

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fromController = TextEditingController(
        text: Provider.of<FromNotifier>(context, listen: false).from);
    toController = TextEditingController(
        text: Provider.of<ToNotifier>(context, listen: false).to);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 97,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).appColors.grey3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              _plane2(),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: CustomTextField(
                    //controller: fromController,
                    hintText: 'Откуда - Москва',
                    controller: TextEditingController(
                        text: context.read<FromNotifier>().from),
                    onChanged: (value) {
                      context.read<FromNotifier>().set(value);
                    },
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).appColors.grey4,
            thickness: 1,
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    _search(),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: Consumer<ToNotifier>(
                            builder: (context, toNotifier, child) {
                          return CustomTextField(
                            hintText: 'Куда - Турция',
                            padding: 6,
                            controller: TextEditingController(
                                text: toNotifier.to),
                            onSubmitted: (v){toNotifier.set(v);}
                            ,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              _cross()
            ],
          ),
        ],
      ),
    );
  }

  Widget _search(){
    return SvgPicture.asset(
      height: 24,
      width: 24,
      colorFilter: ColorFilter.mode(
          Theme.of(context).appColors.grey6, BlendMode.srcIn),
      'assets/search.svg',
      fit: BoxFit.scaleDown,
    );
  }

  Widget _plane2(){
    return SvgPicture.asset(
      height: 24,
      width: 24,
      colorFilter: ColorFilter.mode(
          Theme.of(context).appColors.grey6, BlendMode.srcIn),
      'assets/plane2.svg',
      fit: BoxFit.scaleDown,
    );
  }


  Widget _cross(){
    return InkWell(
      onTap: () {
        Provider.of<ToNotifier>(context, listen: false)
            .set('');
      },
      child: SizedBox(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
              Theme.of(context).appColors.grey6, BlendMode.srcIn),
          'assets/cross.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

}
