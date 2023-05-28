import 'package:blade/app/resources/dimensions/dimensions.dart';
import 'package:blade/app/views/noun_portal_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatGpt_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
     Tab(icon: Icon(Icons.looks_one), child: Text('NOUN\nPortal',
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: Dimensions.fs20),)),
    const Tab(icon: Icon(Icons.looks_two), child: const Text('More\nSpecific',
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: Dimensions.fs20),)),

    Tab(icon: Icon(Icons.looks_3), child: Text('  More\n Creative',style: TextStyle(fontStyle: FontStyle.italic, fontSize: Dimensions.fs20),),),

    const Tab(icon: Icon(Icons.looks_4), child:Text('  More\nBalanced',style: TextStyle(fontStyle: FontStyle.italic, fontSize: Dimensions.fs20),) ),

    const Tab(icon: Icon(Icons.looks_5), child:Text('  More\n Precise',style: TextStyle(fontStyle: FontStyle.italic, fontSize: Dimensions.fs20),) ),

  ];

  static const List<Widget> _views = [
    NounPortalView(),
    ChatGPTView(),
    const Center(child: const Text('Content of Tab Two')),
    const Center(child: const Text('Content of Tab Three')),
    const Center(child: const Text('Content of Tab Four')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } if (states.contains(MaterialState.focused)) {
                return Colors.orange;
              } else if (states.contains(MaterialState.hovered)) {
                return Colors.pinkAccent;
              }
              return Colors.transparent;
            }),
            automaticIndicatorColorAdjustment: true,
            indicatorWeight: 2.0,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(2),
            indicator: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(10), color: Colors.pinkAccent,),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            onTap: (int index) {print('Tab $index is tapped');
            },
            enableFeedback: true,
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            //controller: _tabController,
            tabs: _tabs,
          ),
          title:  Text('Gemini'.tr, style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
          backgroundColor: Colors.teal.shade900,
        ),


        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          children: _views,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
