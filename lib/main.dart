import 'package:bwafm/belajar_http.dart';
import 'package:bwafm/cubit/cubits.dart';
import 'package:bwafm/cubit/transaction_cubit.dart';
import 'package:bwafm/models/models.dart';
import 'package:bwafm/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'cubit/cubits.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
        BlocProvider(create: (_) => FoodCubit())
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: SigninPage())),
    );
  }
}
