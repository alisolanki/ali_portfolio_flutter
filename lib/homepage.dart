import 'dart:ui';

import 'package:ali_portfolio_flutter/values.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static void _launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  static List<Widget> _createButtons(int len) {
    List<Widget> btns = [];
    var names = Values.links.keys.toList();
    for (int i = 0; i < len; i++) {
      btns.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text(
              names[i],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              primary: Colors.white,
              fixedSize: const Size(550, 50),
            ),
            onPressed: () => _launchURL(Values.links.keys.toList()[i]),
          ),
        ),
      );
    }
    return btns;
  }

  final List<Widget> buttons = _createButtons(
    Values.links.keys.length,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //avatar
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: ClipOval(
                child: Image.network(
                  'https://yt3.ggpht.com/KVzMMa4f9ov5r5gyQjTu8DqLa1BtSklYq-u6AjwTEuXMYG-GBVi1q-8ditArpAV6GYUjaUlJ=s900-c-k-c0x00ffffff-no-rj',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //name
            SelectableText(
              Values.name,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            //description
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SelectableText(
                Values.description,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            //buttons
            ...buttons,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Text(
                  'Powered by Ali Solanki',
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                onTap: () => _launchURL('https://alisolanki.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: InkWell(
                child: const Text(
                  'Github Repository of this website',
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                onTap: () => _launchURL(
                    'https://github.com/alisolanki/ali_portfolio_flutter'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _launchURL(Values.floatingActionButtonLink),
        tooltip: Values.floatingActionButtonName,
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
