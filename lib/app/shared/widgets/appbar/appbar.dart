import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 148,
        backgroundColor: const Color(0xff3B66A4),
        title: const ListTileAppBar());
  }

  @override
  Size get preferredSize => const Size.fromHeight(148);
}

class ListTileAppBar extends StatefulWidget {
  const ListTileAppBar({Key? key}) : super(key: key);

  @override
  State<ListTileAppBar> createState() => _ListTileAppBarState();
}

class _ListTileAppBarState extends State<ListTileAppBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? currentUser = _auth.currentUser;
    String? displayName;

    if (currentUser != null) {
      displayName = currentUser.displayName;

      displayName ??= 'Usuário Desconhecido';
    }

    return ListTile(
      title: Text(
        'Olá, $displayName',
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Row(
        children: const [
          Icon(
            TablerIcons.medal,
            color: Colors.amber,
          ),
          Icon(
            TablerIcons.medal,
            color: Color(0xff49BEB7),
          ),
          Icon(TablerIcons.medal)
        ],
      ),
      contentPadding: const EdgeInsets.only(right: 0),
      trailing: const CircleAvatar(
        // backgroundImage: NetworkImage("assets/img/police.png"),
        backgroundColor: Colors.white,
        child: Image(
          color: Color(0xff3B66A4),
          width: 40,
          image: NetworkImage(
              'https://www.shareicon.net/data/128x128/2015/10/20/659128_hat_512x512.png'),
        ),
        // backgroundColor: Colors.white,
        radius: 30,
      ),
    );
  }
}
