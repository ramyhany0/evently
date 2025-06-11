import 'package:evently/ui/home/tabs/HomeTab/HomeTab.dart';
import 'package:evently/ui/home/tabs/LoveTab/LoveTab.dart';
import 'package:evently/ui/home/tabs/MapTab/MapTab.dart';
import 'package:evently/ui/home/tabs/ProfileTab/ProfileTab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../core/FirebaseHandler.dart';
import '../../../model/User.dart' as MyUser;
import '../../../providers/UserProvider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  List<Widget> tabs = [Hometab(), Maptab(), Lovetab(), Profiletab()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirestoreUser();
  }

  getFirestoreUser() async {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    if (provider.myUser == null) {
      MyUser.User? user = await FirebaseHandler.getUser(
        FirebaseAuth.instance.currentUser?.uid ?? "",
      );
      provider.saveUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title:
            provider.myUser == null
                ? Center(child: CircularProgressIndicator())
                : Text('Welcome ${provider.myUser?.name ?? 'User'}'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 50),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: selectedTab,
        onTap: (value) {
          setState(() {
            selectedTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(
              "assets/images/unactiveHome.svg",
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/home.svg",
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Map",
            icon: SvgPicture.asset(
              "assets/images/unactiveMap.svg",
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/map.svg",
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Love",
            icon: SvgPicture.asset(
              "assets/images/unactivelove.svg",
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/love.svg",
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SvgPicture.asset(
              "assets/images/unactiveprofile.svg",
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/profile.svg",
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: tabs[selectedTab],
    );
  }
}
