import 'package:fashion/models/faq.dart';
import 'package:fashion/providers/faq-provider.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    final faqState = Provider.of<FaqProvider>(context, listen: false);
    final data = [...faqState.faqs];

    return Scaffold(
      appBar: const DefaultAppBar(
        title: "FAQ",
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          elevation: 0,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              data[index].expanded = !isExpanded;
            });
          },
          children: data.map<ExpansionPanel>((Faq faq) {
            return ExpansionPanel(
              //question
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(faq.question),
                );
              },
              //answer
              body: ListTile(
                subtitle: Text(faq.answer),
              ),
              isExpanded: faq.expanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
