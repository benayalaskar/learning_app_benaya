import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app_benaya/data/bloc/post_bloc.dart';
import 'package:learning_app_benaya/data/repository/api_repository.dart';
import 'package:learning_app_benaya/presentation/screen/HomeScreen.dart';
import 'package:learning_app_benaya/service/data_repository.dart';

void main() {
  runApp(MyApp(
    dataService: DataService(),
  ));
}

class MyApp extends StatelessWidget {
  final DataService dataService;
  const MyApp({super.key, required this.dataService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            PostBloc(apiRepository: ApiRepository(dataService: dataService))
              ..add(LoadEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
