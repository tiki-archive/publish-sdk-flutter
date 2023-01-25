import 'package:example_app/consent/layout_detail.dart';
import 'package:example_app/consent/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_sdk_flutter/main.dart';

class ConsentLayoutBtn extends StatelessWidget {
  const ConsentLayoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    ConsentService service =
        Provider.of<ConsentService>(context, listen: true);
    return service.model.consent == null ? Container() : Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: const Color(0xFFDDDDDD)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: GestureDetector(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(child: Text("Consent")),
                    Icon(Icons.arrow_forward)
                  ]),
              const Padding(padding: EdgeInsets.all(8.0)),
              Text(Bytes.base64UrlEncode(service.model.consent!.transactionId!)
              )]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: service, child: const ConsentLayoutDetail())))));
  }
}