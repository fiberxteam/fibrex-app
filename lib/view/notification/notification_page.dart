import 'package:fiber/config/constant.dart';
import 'package:fiber/view/notification/components/notify_widget.dart';
import 'package:fiber/view/notification/components/offers_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../plans/components/custom_back_button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 70,
            leadingWidth: 70,
            leading: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(Insets.margin),
                CustomBackButton(),
              ],
            ),
            title: Text(
              "الاشعارات",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Insets.margin),
                padding: EdgeInsets.all(Insets.exSmall),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  ),
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text("العروض"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text("التنبيهات"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: 15,
                          padding: EdgeInsets.all(Insets.medium),
                          separatorBuilder: (context, index) =>
                              Gap(Insets.small),
                          itemBuilder: (context, index) {
                            return OffersCardWidget();
                          },
                        ),
                      )
                    ].animate(interval: 50.ms).fadeIn(),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: 15,
                          padding: EdgeInsets.all(Insets.medium),
                          separatorBuilder: (context, index) =>
                              Gap(Insets.small),
                          itemBuilder: (context, index) {
                            return NotifyWidget();
                          },
                        ),
                      )
                    ].animate(interval: 50.ms).fadeIn(),
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
