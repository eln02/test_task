import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/config/theme/colors.dart';

import '../../../../search_page/presentation/pages/search_page.dart';
import '../../../../shared/shared_state/to_notifier.dart';

class CityWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const CityWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Provider.of<ToNotifier>(context, listen: false).set(title);
        await Future.delayed(const Duration(seconds: 1));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(imagePath, fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text("Популярное направление",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Theme.of(context).appColors.grey6))
                ],
              )
            ]),
            const SizedBox(
              height: 8,
            ),
            Divider(
              color: Theme.of(context).appColors.grey6,
              thickness: 1,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
