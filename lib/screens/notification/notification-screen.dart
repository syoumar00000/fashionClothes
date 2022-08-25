import 'package:fashion/models/notification.dart';
import 'package:fashion/providers/notification-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final notificationState =
        Provider.of<NotificationProvider>(context, listen: false);

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Notifications",
        icon: Icon(
          Icons.notifications_outlined,
          color: Colors.grey.shade400,
        ),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: notificationState.items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final notification = notificationState.items[index];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 4,
                        color: notificationColors[notification.type]!,
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  if (!notification.read) ...[
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    kSpaceW(0.5)
                                  ],
                                  Text(
                                    notification.title,
                                    style: kSubtitle1(context)
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    DateFormat('MM/dd')
                                        .format(notification.date!),
                                  ),
                                ],
                              ),
                              kSpaceH(1.25),
                              Text(
                                notification.content,
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
