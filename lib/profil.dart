import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "WorkSans",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(16),
        // height: size.height,
        // width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('assets/images/earth.png'),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    //color: Colors.primaryColor.withOpacity(.5),
                    width: 1.0,
                  )),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              width: double.infinity,
              height: 100.0,
              child: Center(
                child: Text(
                  'Hai Darla',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilWidget(
                    icon: Icons.person,
                    title: 'My Profile',
                  ),
                  ProfilWidget(
                    icon: Icons.phone,
                    title: 'Contact Us',
                  ),
                  ProfilWidget(
                    icon: Icons.lock,
                    title: 'Privacy Policy',
                  ),
                  ProfilWidget(
                    icon: Icons.verified,
                    title: 'Terms & Condition',
                  ),
                  ProfilWidget(
                    icon: Icons.logout,
                    title: 'Logout',
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ProfilWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfilWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.green,
                size: 24.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.green,
            size: 16.0,
          )
        ],
      ),
    );
  }
}
