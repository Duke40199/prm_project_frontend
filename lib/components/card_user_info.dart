import 'package:prm_project/style/style.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../style/style.dart';

class CardUserDetailInfo extends StatelessWidget {
  final String username, avatarUrl, fullname, email, phoneNumber;

  const CardUserDetailInfo(
      {Key key,
      this.username,
      this.avatarUrl,
      this.email,
      this.fullname,
      this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(97, 0, 60, 10),
                child: GFAvatar(
                    radius: 100,
                    backgroundImage: (avatarUrl != null)
                        ? NetworkImage(avatarUrl)
                        : AssetImage(
                            'lib/assets/images/user-default-image.png'),
                    shape: GFAvatarShape.standard),
                // Name & info boxes container,
              ),
            ],
          ),
          Text(
            (username ?? "None"),
            style: textStyleHeadingPrimary,
          ),
          Text(
            (fullname ?? "None"),
            style: textStyleHeading,
          ),
          Text((email ?? "None"), style: textStyleHeading),
          Text((phoneNumber ?? "None"), style: textStyleHeading),
          QrImage(
            data: username,
            size: 200,
          )
        ],
      ),
    );
  }
}
