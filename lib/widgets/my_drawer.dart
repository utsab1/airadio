import 'package:ai_radio/model/radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required Color? selectedColor,
    required this.radios,
  })  : _selectedColor = selectedColor,
        super(key: key);

  final Color? _selectedColor;
  final List<MyRadio>? radios;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3.0,
      child: Container(
        color: Colors.white,
        child: radios != null
            ? [
                1.heightBox,
                "All Channels".text.xl.black.semiBold.make().p16(),
                20.heightBox,
                ListView(
                  padding: Vx.m0,
                  shrinkWrap: true,
                  children: radios!
                      .map((e) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(e.icon!),
                            ),
                            title: "${e.name} FM".text.black.make(),
                            subtitle: e.tagline!.text.black.make(),
                          ))
                      .toList(),
                ).expand()
              ].vStack(
                crossAlignment: CrossAxisAlignment.start,
              )
            : const Offstage(),
      ),
    );
  }
}
