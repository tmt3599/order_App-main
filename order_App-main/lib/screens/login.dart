import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:order_app/screens/screens.dart';
import 'package:order_app/widgets/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                SvgPicture.asset(
                  "images/bg-sign-up.svg",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Center(
                          // child: Image(
                          //   // image: AssetImage("images/logo1.png"),
                          //   width: 100,
                          //   height: 100,
                          //   alignment: Alignment.center,
                          // ),
                          ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: <Widget>[
                            RoundeInput(
                              size: _width,
                              icon: Icons.phone_android,
                              title: "Số điện thoại",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RoundeInput(
                              size: _width,
                              icon: Icons.lock,
                              title: "Mật khẩu",
                              isPassWord: true,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // RoundedButton(
                            //   size: _width,
                            //   title: 'ĐĂNG NHẬP',
                            //   onTap: () => Navigator.of(context).push(
                            //       MaterialPageRoute(
                            //           builder: (context) => const NavScreen())),
                            // ),
                            SizedBox(
                              width: _width * 0.8,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.blue.shade700,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const NavScreen()));
                                },
                                child: const Text(
                                  'ĐĂNG NHẬP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: _width * 0.8,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      color: Colors.grey.shade300,
                                      height: 1,
                                      margin: const EdgeInsets.only(right: 16),
                                    ),
                                    flex: 3,
                                  ),
                                  Text(
                                    'Hoặc',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.grey.shade300,
                                      height: 1,
                                      margin: const EdgeInsets.only(left: 16),
                                    ),
                                    flex: 3,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: _width * 0.8,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.blue.shade400,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Đăng nhập bằng Facebook',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Bạn chưa có tài khoản?",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14),
                                ),
                                const SizedBox(width: 4),
                                GestureDetector(
                                  child: const Text(
                                    'Đăng ký',
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 14),
                                  ),
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     new MaterialPageRoute(
                                    //         builder: (context) => SignUp()));
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      flex: 6,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
