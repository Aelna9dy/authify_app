import 'package:authify_app/pages/login_page.dart';
import 'package:authify_app/utills/animation/login_page_animation.dart';
import 'package:authify_app/utills/page_routes/slide_page_animation.dart';
import 'package:flutter/material.dart';

class AnimatedHomePage extends StatefulWidget {
  const AnimatedHomePage({super.key});

  @override
  State<AnimatedHomePage> createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
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
    return HomePage(_controller);
  }
}

class HomePage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  final Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);
  final Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);

  final AnimationController _controller;
  late EnterAnimation _animation;

  // HomePage(this._controller,this._animation, {super.key});

  HomePage(this._controller, {super.key}) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: _deviceWidth,
          height: _deviceHeight * 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _avatarWidget(),
              _nameWidget(),
              SizedBox(height: _deviceHeight * 0.03),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double circcleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _animation.controller.value,
            _animation.controller.value,
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

  Widget _nameWidget() {
    return Text(
      "John Doe",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: _secondaryColor,
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: _primaryColor),
      ),
      onPressed: () {
        Navigator.push(context, SlidePageRoute(AnimatedLoginPage()));
      },
      minWidth: _deviceWidth * 0.40,
      height: _deviceHeight * 0.05,
      color: Colors.white,
      child: Text(
        "Log Out",
        style: TextStyle(
          fontSize: 16,
          color: _primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
