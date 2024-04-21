import 'package:flutter/material.dart';

// Menu

// ignore: must_be_immutable
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
        /*    UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(159, 186, 71, 1),
              ),
              accountName: const Text("sdqdqsdqd",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )),
              accountEmail: const Text("dqdqd",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color.fromRGBO(159, 186, 71, 1),
                backgroundImage: ImageUtils.base64ToImage(image2),
              )),
          */ ProfileMenu(
            text: "Page d'accueil",
            icon: "assets/images/logo.png",
            press: () {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          /*    ListTile(
            title: Center(
              child: Text("Version: 20.0.12"),
            ),
          ),
          ListTile(
            title: Center(
              child: Text(" Copyright (c) 2022 \b IDS "),
            ),
          ), */
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // ignore: deprecated_member_use
      child: MaterialButton(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color.fromRGBO(159, 186, 71, 1),
        onPressed: press,
        child: const Row(
          children: [
            /*  SvgPicture.asset(
              icon,
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 0.05,
            ), */
            SizedBox(width: 20),
            Expanded(child: Text("text")),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
