import 'package:fiber/config/const_wodget/no_data_widget.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/utils/const_class.dart';
import 'package:fiber/controller/settings/questions_controller.dart';
import 'package:fiber/models/questions_model.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you have GetX imported

import '../components/custom_expanded_panel.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  QuestionsController controller = Get.put(QuestionsController());

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
        body: Obx(
              () => controller.isLoading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              : !controller.isLoading.value && controller.questions.isEmpty
              ? NoDataWidget(
            details: "سيتم نشر الاسئلة الشائعة في اقرب وقت",
            refresh: () => controller.getData(),
          )
              : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Insets.margin),
              child: _buildPanel(controller.questions),
            ),
          ),
        ));
  }

  Widget _buildPanel(List<Datum> data) {
    return CustomExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        print(index);
        print(isExpanded);
        setState(() {
          // Toggle the isExpanded flag for the specific item
          data[index].isExpanded = !isExpanded;
        });
      },
      children: data.map<ExpansionPanel>((Datum item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.question ?? "No question available"),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 0.5),
              Padding(
                padding: EdgeInsets.all(8.0),  // Adjusted padding
                child: Text(
                  item.answer ?? "No answer available",
                  style: context.theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xFF7C758A)),
                ),
              ),
            ],
          ),
          isExpanded: item.isExpanded ?? false,
        );
      }).toList(),
    );
  }
}
