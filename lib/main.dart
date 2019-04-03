import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/blocs/slots/slots.dart';
import 'package:starter/routes.dart';

void main() => runApp(TangCa());

class TangCa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TangCaState();
}

class _TangCaState extends State<TangCa> {
  final _bloc = SlotsBloc();

  @override
  void initState() {
    _bloc.dispatch(LoadSlots());

    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlotsBloc>(
      bloc: _bloc,
      child: MaterialApp(
        title: 'Flutter Starter',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          primaryTextTheme: TextTheme(
            title: TextStyle(
              color: Color(0xFF4CAF50),
              fontWeight: FontWeight.w700,
            ),
          ),
          primaryColor: Color(0xFF151B1E),
          accentColor: Color(0xFF4CAF50),
          scaffoldBackgroundColor: Color(0xFF263238),
        ),
        home: Router.homePage,
        onGenerateRoute: Router.onGenerateRoute,
      ),
    );
  }
}
