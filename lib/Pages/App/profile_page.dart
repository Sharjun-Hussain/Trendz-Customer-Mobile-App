import 'package:flutter/material.dart';
import 'package:trendz_customer/widgets/main_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 18,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              child: Image.asset(
                            width: 40,
                            height: 40,
                            "lib/assets/images/profile.png",
                            fit: BoxFit.cover,
                          )),
                          // Container(
                          //     width: 40,
                          //     height: 40,
                          //     decoration: const BoxDecoration(
                          //         shape: BoxShape.circle, color: Colors.white),
                          //     child: Image.asset(
                          //       "assets/images/profile.png",
                          //       fit: BoxFit.cover,
                          //     ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohamed Hussain Sharjun",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text("SharjunHussain@outlook.com",
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MainNavigationForUserProfilePage(
                navigate: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()))
                },
                navigationtitle: "Your Profile",
                navigationIcon: Icon(Icons.person_2_outlined,
                    size: 24, color: Theme.of(context).primaryColor),
              ),
              MainNavigationForUserProfilePage(
                navigate: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                navigationtitle: "Payment Methods",
                navigationIcon: Icon(Icons.payment_rounded,
                    size: 24, color: Theme.of(context).primaryColor),
              ),
              MainNavigationForUserProfilePage(
                navigate: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                navigationtitle: "Settings",
                navigationIcon: Icon(Icons.settings,
                    size: 24, color: Theme.of(context).primaryColor),
              ),
              MainNavigationForUserProfilePage(
                navigate: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                navigationtitle: "Transactions",
                navigationIcon: Icon(Icons.route_outlined,
                    size: 24, color: Theme.of(context).primaryColor),
              ),
              MainNavigationForUserProfilePage(
                navigate: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                navigationtitle: "Help Center",
                navigationIcon: Icon(Icons.info_outline,
                    size: 24, color: Theme.of(context).primaryColor),
              ),
              MainNavigationForUserProfilePage(
                navigate: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                navigationtitle: "Privacy Policy",
                navigationIcon: Icon(Icons.screen_lock_portrait,
                    size: 24, color: Theme.of(context).primaryColor),
              ),
              MainNavigationForUserProfilePage(
                navigate: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                navigationtitle: "Log out",
                navigationIcon: Icon(Icons.logout_outlined,
                    size: 24, color: Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
