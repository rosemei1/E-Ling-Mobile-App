import 'package:flutter/material.dart';
import 'package:proto/profil_widget.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage(''),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      //color: Colors.primaryColor.withOpacity(.5),
                      width: 5.0,
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
                height: size.height * 7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilWidget(icon: Icons.person, title: 'My Profile',),
                    ProfilWidget(icon: Icons.phone, title: 'Contact Us',),
                    ProfilWidget(icon: Icons.lock, title: 'Privacy Policy',),
                    ProfilWidget(icon: Icons.verified, title: 'Terms & Condition',),
                    ProfilWidget(icon: Icons.logout, title: 'Logout',),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








































