import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_clone_1/Recipes_part/explore.dart';
import 'package:test_clone_1/auth/auth_page.dart';
import 'package:test_clone_1/auth/main_page.dart';

import '../welcome_page/login.dart';
import 'color_fonts.dart';

class profile_page extends StatelessWidget {
  profile_page({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kDarkTheme,
      builder: (context, kDarkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context),
          home: ProfileScreen(),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,

      // minTextAdapt: true,
    );
    var ProfileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/images/background.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: kDarkPrimaryColor,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(user.email!, style: kTitleTextStyle),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text('SUPPORT ME'),
            ),
          ),
        ],
      ),
    );
    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            crossFadeState: Theme.of(context).brightness == Brightness.dark
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: GestureDetector(
              onTap: () =>
                  ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  LineAwesomeIcons.sun,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                ),
              ),
            ),
            secondChild: GestureDetector(
              onTap: () =>
                  ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  LineAwesomeIcons.moon,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                ),
              ),
            ));
      },
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8),
          child:  IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Explore()),
              );
            },
            icon: Icon(
              LineAwesomeIcons.arrow_left,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        ),
        ProfileInfo,
        themeSwitcher,
      ],
    );
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_shield,
                        text: ('Privacy'),
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text: ('History'),
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: ('Help & Support'),
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: ('setting'),
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_plus,
                        text: ('Invite a Friend'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await  FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.alternate_sign_out,
                          text: ('Logout'),
                          hasNavigation: false,
                        ),
                      ),
                      // terb dak
                      // FlatButton(
                      //   onPressed: () {
                      //     FirebaseAuth.instance.signOut();
                      //   },
                      //   color: Colors.blue,
                      //   child: Text('Logout'),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;
  const ProfileListItem({
    Key? key,
    required this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w * 2.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}
