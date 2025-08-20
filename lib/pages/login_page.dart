import 'package:authify_app/pages/custom_form_field.dart';
import 'package:authify_app/utills/animation/login_page_animation.dart';
import 'package:authify_app/utills/page_routes/fade_page_routes.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class AnimatedLoginPage extends StatefulWidget {
  const AnimatedLoginPage({super.key});

  @override
  State<AnimatedLoginPage> createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(milliseconds: 400),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enterAnimation = EnterAnimation(_controller);
    return LoginPage(_controller, enterAnimation);
  }
}

class LoginPage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  final Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  final Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);

  final AnimationController _controller;
  late final EnterAnimation _enterAnimation;

  LoginPage(this._controller, this._enterAnimation, {super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: _deviceHeight * 0.60,
          width: _deviceWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _avatarWidget(),
              CustomFormField(
                hintText: "johan@example.com",
                customWidth: _deviceWidth * 0.75,
                obscureText: false,
              ),
              CustomFormField(
                hintText: "Password",
                customWidth: _deviceWidth * 0.75,
                obscureText: true,
              ),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double circcleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _enterAnimation.controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _enterAnimation.circleSize.value,
            _enterAnimation.circleSize.value,
            1,
          ),
          child: Container(
            height: circcleD,
            width: circcleD,
            decoration: BoxDecoration(
              color: _secondaryColor,
              borderRadius: BorderRadius.circular(500),
              image: DecorationImage(
                image: AssetImage("assets/images/main_avatar.png"),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.white),
      ),
      onPressed: () async {
        await _controller.reverse();
        Navigator.pushReplacement(context, FadePageRoute(AnimatedHomePage()));
      },
      minWidth: _deviceWidth * 0.40,
      height: _deviceHeight * 0.05,
      color: Colors.white,
      child: Text(
        "Log In",
        style: TextStyle(
          fontSize: 16,
          color: _primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
