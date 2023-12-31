import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:recipe_app/pages/importpackage.dart';

class updateProfileScreen extends StatelessWidget {
  const updateProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile,style: GoogleFonts.sofia(textStyle: Theme.of(context).textTheme.headline4?.copyWith(color: Color(0xFFFA8072),
      ),))
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tPic)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right:  0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.yellow),
                    child: const Icon(
                      LineAwesomeIcons.camera,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
