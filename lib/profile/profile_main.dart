import 'package:beetle/custom_widgets/rounded_text_button.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beetle/globals.dart' as globals;

class ProfileMain extends StatelessWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String password = '';
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DottedBorder(
          color: kBeetleMainColor,
          radius: const Radius.circular(20),
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: const [4, 5],
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: kForumCardDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 7,
                  child: CircleAvatar(
                    radius: 100,
                    child: Lottie.asset(kWalkingPlant),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: kBeetleMainColor,
                    height: 40,
                    thickness: 2,
                  ),
                ),
                SearchBar(
                  icon: Icons.password,
                  onChanged: (newPassword) {
                    password = newPassword;
                  },
                  label: 'Enter new password',
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextButtonRoundedEdges(
                    onPressed: () async {
                      dynamic response =
                          await BeetleNetworking().updatePassword(
                        password,
                      );
                      if (response != 403) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          kDoneSnackBar,
                        );
                        globals.password = password;
                      }
                    },
                    text: 'Confirm',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
