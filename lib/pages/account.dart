import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'importpackage.dart';
import 'package:get/get.dart';
import 'updateProfileScreen.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Theme(
        // Use ThemeData.dark() if isDark is true, ThemeData.light() otherwise
        data: isDark ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(LineAwesomeIcons.angle_left),
            ),
            title: Text(
              tProfile,
              style: GoogleFonts.sofia(
                textStyle: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Color(0xFFFA8072),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                  color: Color(0xFFFA8072), // Set the color for the icon
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                Stack(
                  children: [
                    SizedBox(
                    width: 120,
                      height: 120,
                    child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tPic),)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow,
                          ),
                          child: const Icon(LineAwesomeIcons.alternate_pencil,size: 20,color: Colors.black)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(tProfileHeading,style: Theme.of(context).textTheme.headline4),
                Text(tSubHeading, style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(height: 20),
                  SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const updateProfileScreen()),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, side: BorderSide.none, shape: const StadiumBorder()),
                    child: const Text(tEditProfile,style: TextStyle(color: Colors.black87)),
                )),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  ProfileMenuWidget(title: "Setting", icon: LineAwesomeIcons.cog,onPress: (){}),
                  ProfileMenuWidget(title: "Details", icon: LineAwesomeIcons.wallet,onPress: (){}),
                  ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check,onPress: (){}),
                  Divider(color: Colors.grey.withOpacity(0.5)),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info,onPress: (){}),
                  ProfileMenuWidget(title: "Logout", icon: LineAwesomeIcons.alternate_sign_out,textColor:Colors.red,endIcon: false,onPress: (){}),
            ],
          ),
        ),
      ),
    ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }): super(key : key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.deepPurpleAccent.withOpacity(0.1),
        ),
        child:  Icon(icon, color: Colors.deepPurpleAccent),
      ),
      title: Text(title,style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
      ),
        child: const Icon(LineAwesomeIcons.angle_right,size: 18.0,color: Colors.grey)) : null,
    );
  }
}

// class AccountState extends State<Account> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 80),
//           child: Text(
//             "Account",
//             style: GoogleFonts.sofia(
//                 textStyle:
//                 const TextStyle(fontSize: 30, color: Color(0xFFFA8072))),
//           ),
//         ),
//       ),
//     );
//   }
// }