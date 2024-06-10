import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/appBar_widget.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/button_bar_widget.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/home_page_grid_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      const FetchEcommerceEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBarWidget(),
      body: Column(
        children: [ButtonBarWidget(), Expanded(child: HomePgaeGridView())],
      ),
    );
  }
}
