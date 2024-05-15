import 'package:dw_barbershop/core/ui/constants.dart';
import 'package:dw_barbershop/core/ui/helpers/form_helpers.dart';
import 'package:dw_barbershop/core/ui/helpers/messages.dart';
import 'package:dw_barbershop/features/auth/login/login_state.dart';
import 'package:dw_barbershop/features/auth/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginVM(:login) = ref.watch(loginVMProvider.notifier);

    ref.listen(loginVMProvider, (_, state) {
      switch (state) {
        case LoginState(status: LoginStateStatus.initial):
          break;
        case LoginState(status: LoginStateStatus.admLogin):
          break;
        case LoginState(status: LoginStateStatus.employeeLogin):
          break;
        case LoginState(status: LoginStateStatus.error, :final errorMessage?):
          Messages.showError(errorMessage, context);
        case LoginState(status: LoginStateStatus.error):
          Messages.showError('Erro ao realizar login', context);
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstats.backgroundChair),
                opacity: 0.4,
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageConstats.imageLogo),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onTapOutside: (_) => unfocus(context),
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigatório'),
                              Validatorless.email('E-mail inválido')
                            ]),
                            controller: emailEC,
                            decoration: const InputDecoration(
                              label: Text('E-mail'),
                              hintText: 'E-mail',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onTapOutside: (_) => unfocus(context),
                            controller: passwordEC,
                            obscureText: true,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória'),
                              Validatorless.min(6,
                                  'Senha deve conter pelo menos 6 caracteres')
                            ]),
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                              hintText: 'Senha',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Esqueceu a senha?',
                                style: TextStyle(
                                    color: ColorsConstants.brown,
                                    fontSize: 12)),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(56)),
                              onPressed: () {
                                switch (formKey.currentState?.validate()) {
                                  case (false || null):
                                    Messages.showError(
                                        'Campos inválidos', context);
                                    break;
                                  case (true):
                                    login(emailEC.text, passwordEC.text);
                                }
                              },
                              child: const Text('ACESSAR'))
                        ],
                      ),
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Criar conta',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
