import 'package:flutter/material.dart';

import 'destination_edit.dart';

class DestinationCard extends StatelessWidget {
  final String url;
  final String httpMethod;
  final int interval;
  final Function(String url, String httpMethod, int interval) updateDestination;

  const DestinationCard(
      this.url, this.httpMethod, this.interval, this.updateDestination,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.0, color: const Color(0xFFCCCCCC)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: GestureDetector(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: Text(
                      "Destination",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )),
                    Icon(Icons.keyboard_arrow_right)
                  ]),
              const Padding(padding: EdgeInsets.all(8.0)),
              Text(
                "$httpMethod $url",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10))
            ]),
            onTap: () async {
              List destinationDetails = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          DestinationEdit(url, httpMethod, interval)));
              updateDestination(destinationDetails[0], destinationDetails[1],
                  destinationDetails[2]);
            }));
  }
}
