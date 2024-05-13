import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/shared/config/theme/theme.dart';
import 'package:test_task/shared/shared_state/date_notifier.dart';

import 'main_page/presentation/pages/main_page.dart';
import 'shared/shared_state/from_notifier.dart';
import 'shared/shared_state/to_notifier.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FromNotifier()),
        ChangeNotifierProvider(create: (context) => ToNotifier()),
        ChangeNotifierProvider(create: (context) => DateNotifier()),
      ],
      child: MaterialApp(
        //title: 'Flutter Demo',
        theme: theme,
        home: const MainPage(),
      ),
    );
  }
}
