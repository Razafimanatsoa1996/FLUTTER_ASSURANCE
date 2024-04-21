import 'package:flutter/widgets.dart';
import 'package:flutter_assurance/core/styles/style.dart';
import 'package:flutter_assurance/core/utils/router/app_router.dart';
import 'package:flutter_assurance/core/utils/widgets/imput_text_form.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_event.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assurance/features/subscribe/presentation/manager/subscribe_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:device_info_plus/device_info_plus.dart';

@RoutePage()
class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});
  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  final _formKey = GlobalKey<FormState>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String model = " ";
  String os = " ";

  @override
  void initState() {
    super.initState();
    _getInfo(context);
    // Add your initialization logic here
  }

  void _getInfo(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    final device = androidInfo.device;
    final version = androidInfo.version;
    setState(() {
      model = device;
      os = "android sdk ${version}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 94, 32, 1),
      /*  Image.asset(
                    'assets/images/aro.jpeg',
                    height: 150,
                    fit: BoxFit.fitWidth,
                  ), */
      body: SafeArea(
        child: BlocListener<SubscribeBloc, SubscribeState>(
          listener: (context, state) {
            if (state is SubscribeErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(
                  'an_error_has_occurred'.tr(),
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<SubscribeBloc, SubscribeState>(
            builder: (context, state) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
                    ),
                    _topheader(),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              top: 50, right: 15, left: 15),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: Colors.grey[50],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InputTextFormWidget(
                                    label: 'example@email.com'.tr(),
                                    isRequired: true,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      context.read<SubscribeBloc>().add(
                                              UpdateUserEvent(
                                                  state.user.copyWith(
                                            mail: value,
                                          )));
                                    },
                                  ),
                                  InputTextFormWidget(
                                    label: '03x xx xxx xx'.tr(),
                                    isRequired: true,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      context.read<SubscribeBloc>().add(
                                              UpdateUserEvent(
                                                  state.user.copyWith(
                                            phonNumber: int.parse(value),
                                          )));
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 56,
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: MaterialButton(
                                        onPressed: () {
                                          print('sed lasa');

                                          /*  _formKey.currentState != null &&
                                                  _formKey.currentState!
                                                      .validate()
                                              ? () {

                                                print('sedato'); */

                                          context.read<SubscribeBloc>().add(
                                                  UpdateUserEvent(
                                                      state.user.copyWith(
                                                os: os,
                                              )));

                                          context.read<SubscribeBloc>().add(
                                                  UpdateUserEvent(
                                                      state.user.copyWith(
                                                marque: model,
                                              )));
                                          DateTime now = DateTime.now();
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd HH:mm:ss')
                                                  .format(now);

                                          context.read<SubscribeBloc>().add(
                                                  UpdateUserEvent(
                                                      state.user.copyWith(
                                                dateSubscribe: formattedDate,
                                              )));

                                          context
                                              .read<SubscribeBloc>()
                                              .add(SendSusEvent(User(
                                                email: state.user.email,
                                                telephone: state.user.telephone,
                                                marque: state.user.marque,
                                                os: state.user.os,
                                                dateSubscribe:
                                                    state.user.dateSubscribe,
                                              )));
                                          print('sedrick lasa');
                                          /*    context
                                                      .read<SubscribeBloc>()
                                                      .add(SaveUserEvent(
                                                         state.user,
                                                      ));  */
                                          /*  }
                                              : null; */
                                          /* context.router
                                              .push(const HomeRoute()); */
                                        },
                                        color:
                                            const Color.fromRGBO(27, 94, 32, 1),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: const Text(
                                          "S'abonner",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      _loginSocialMediaBtn(
                                          FontAwesomeIcons.facebookF,
                                          facebookColor),
                                      const SizedBox(width: 16),
                                      _loginSocialMediaBtn(
                                          FontAwesomeIcons.google, googleColor),
                                      const SizedBox(width: 16),
                                      _loginSocialMediaBtn(
                                          FontAwesomeIcons.twitter,
                                          twitterColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ]);
            },
          ),
        ),
      ),
    );
  }

  _createAccountLink() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(bottom: 16),
      height: 60,
      child: Center(
        child: Text(
          'Don\'t have account ? Subscribe Up Now',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: facebookColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  //button to login in using scial media,
  _loginSocialMediaBtn(IconData icon, Color bgColor) {
    return SizedBox.fromSize(
      size: const Size(54, 54), //button width and height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          elevation: 16,
          shadowColor: Colors.black,
          color: bgColor,
          child: InkWell(
            splashColor: Colors.white12,
            onTap: () {},
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _inputPasswordField(hintText, bool obscuretext) {
    return Container(
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: const EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextField(
          obscureText: obscuretext,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }

  _inputTextField(hintText, bool obscuretext) {
    return Container(
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: const EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }

  _inputNumberField(hintText, bool obscuretext) {
    return Container(
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: const EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }

  _inputMailField(hintText, bool obscuretext) {
    return Container(
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
      margin: const EdgeInsets.all(8),
      decoration: raisedDecoration,
      child: Center(
        child: TextField(
          onChanged: (value) {},
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          obscureText: obscuretext,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }

  _labelText(title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  _topheader() {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Assurance\nAro',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          Image.asset(
            'assets/images/logo2.gif',
            height: 150,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}
