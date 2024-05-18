import 'package:fiber/config/constant.dart';
import 'package:fiber/config/utils/const_class.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../components/custom_expanded_panel.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final List<Item> _data = generateItems(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 65,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Insets.margin),
            const CustomBackButton(),
          ],
        ),
        title: Text(
          "الاسئلة الشائعة",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(Insets.margin),
            child: _buildPanel(),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return CustomExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        print(index);
        print(isExpanded);
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text("ما هي سرعة الإنترنت التي أستطيع الحصول عليها؟");
          },
          body: Column(
            children: [
              Divider(
                thickness: 0.5,
              ),
              Padding(
                padding: EdgeInsets.all(Insets.margin),
                child: Text(
                  "تعتمد سرعة الإنترنت على خطة FTTH التي تختارها. يقدم تطبيق FTTH مجموعة متنوعة من الخطط بسرعات مختلفة لتناسب احتياجاتك. يمكنك استخدام أداة اختبار السرعة في التطبيق لمعرفة سرعة الإنترنت المتاحة في منطقتك.",
                  style: context.theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xFF7C758A)),
                ),
              ),
              Gap(Insets.small),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
