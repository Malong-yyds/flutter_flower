import 'package:demo1/identify/DotsIndicator.dart';
import 'package:demo1/identify/company_hot_job.dart';
import 'package:demo1/identify/company_inc.dart';
import 'package:demo1/identify/model/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'company_info.dart';

const double _kAppBarHeight = 256.0;

class CompanyDetail extends StatefulWidget {
  const CompanyDetail(this._company);
  final Company _company;
  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {
  late List<Widget> _imagePages;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  late List<Tab> _tabs;
  late TabController _tabController;
  late VoidCallback onChanged;
  late int _currentIndex;
  late Widget _companyTabContent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imagePages = [];
    for (var url in _urls) {
      _imagePages.add(Container(
        color: Colors.black,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Image.network(
            url,
            height: _kAppBarHeight,
            fit: BoxFit.cover,
          ),
        ),
      ));
    }

    _companyTabContent = CompanyInc(widget._company.inc);
    _tabs = [
      const Tab(text: '公司概况 '),
      const Tab(
        text: '热招岗位',
      )
    ];
    _tabController = TabController(length: _tabs.length, vsync: this);
    onChanged = (() {
      if (_currentIndex == 0) {
        _companyTabContent = CompanyInc(widget._company.inc);
      } else {
        _companyTabContent = CompanyHotJob();
      }
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
    _tabController.addListener(() {
      onChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox.fromSize(
                size: const Size.fromHeight(_kAppBarHeight),
                child: IndicatorViewPager(pages: _imagePages),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    CompanyInfo(widget._company),
                    const Divider(),
                    TabBar(
                      tabs: _tabs,
                      controller: _tabController,
                      indicatorWeight: 3.0,
                      labelStyle: const TextStyle(fontSize: 16.0),
                      labelColor: Colors.black,
                    )
                  ],
                ),
              ),
              _companyTabContent
            ]),
          ),
          Positioned(
            top: 25.0,
            left: 10.0,
            child: BackButton(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
