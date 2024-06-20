import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge_treeview/cubit/assets_cubit.dart';
import 'package:tractian_challenge_treeview/cubit/companies_cubit.dart';
import 'package:tractian_challenge_treeview/cubit/locations_cubit.dart';
import 'package:tractian_challenge_treeview/screens/companies/companies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CompaniesCubit()),
        BlocProvider(create: (context) => LocationCubit()),
        BlocProvider(create: (context) => AssetsCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CompaniesScreen(),
      ),
    );
  }
}
