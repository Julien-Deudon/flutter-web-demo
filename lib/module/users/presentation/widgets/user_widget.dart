import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GFCard(
        title: GFListTile(
          title: Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subTitle: Text(user.email),
          avatar: const Icon(
            Icons.person,
            size: 32,
          ),
        ),
        content: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.company.name),
              Text(user.phone),
              Text(user.website),
            ],
          ),
        ),
        buttonBar: GFButtonBar(
          children: [
            GFButton(
              onPressed: () {
                final String contactMethod = kIsWeb
                    ? user.email
                    : Platform.isIOS
                        ? user.website
                        : user.phone;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Contact'),
                        content:
                            Text('Contact ${user.name} on $contactMethod ? '),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).pop(context);
                            },
                            child: const Text('No'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _launchContactMethod(contactMethod);
                              GoRouter.of(context).pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    });
              },
              text: 'Contact',
            )
          ],
        ),
      ),
    );
  }

  void _launchContactMethod(String contactMethod) async {
    String parsedContactMethod =
        'mailto:$contactMethod?subject=Hello Octogone&body=Flutter Multiplatform Demo';

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        parsedContactMethod = 'tel:$contactMethod';
      } else if (Platform.isIOS) {
        parsedContactMethod = 'http:$contactMethod';
      }
    }

    try {
      final canOpen = await canLaunch(parsedContactMethod);

      if (canOpen) {
        await launch(parsedContactMethod, enableJavaScript: kIsWeb);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
