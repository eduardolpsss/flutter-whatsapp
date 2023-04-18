import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color_palette.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerName =
      TextEditingController(text: "Lucas Silva");
  TextEditingController controllerEmail =
      TextEditingController(text: "lucasSilva@gmail.com");
  TextEditingController controllerPassword =
      TextEditingController(text: "12345678");
  bool userRegister = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  fieldValidation() async {
    String name = controllerName.text;
    String email = controllerEmail.text;
    String password = controllerPassword.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (password.isNotEmpty && password.length >= 8) {
        if (userRegister) {
          if (name.isNotEmpty && name.length >= 3) {
            await auth
                .createUserWithEmailAndPassword(
                    email: email, password: password)
                .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Login realizado com sucesso"),
                  backgroundColor: ColorPallete.backgroundColor2,
                ),
              );
              // ignore: avoid_print
              print("UID do usuário: ${value.user!.uid}");
              // ignore: avoid_print
              print("Email: $email");
              // ignore: avoid_print
              print("Senha: $password");
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Erro ao realizar o login"),
                  backgroundColor: Colors.red,
                ),
              );
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Nome inválido"),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login realizado com sucesso"),
              backgroundColor: ColorPallete.backgroundColor2,
            ),
          );
          // ignore: avoid_print
          print("Email: $email");
          // ignore: avoid_print
          print("Senha: $password");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Senha inválida"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email inválido"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: ColorPallete.backgroundColor,
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.5,
                decoration: const BoxDecoration(
                  color: ColorPallete.backgroundColor2,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      width: 500,
                      child: Column(
                        children: [
                          Visibility(
                            visible: userRegister,
                            child: ClipOval(
                              child: Image.asset(
                                "imagens/perfil.png",
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: userRegister,
                            child: OutlinedButton(
                              onPressed: () {},
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Escolher imagem",
                                style: const TextStyle(
                                  color: ColorPallete.backgroundColor2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: userRegister,
                            child: Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: Theme.of(context)
                                      .colorScheme
                                      .copyWith(
                                        primary: ColorPallete.backgroundColor2,
                                      ),
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    controller: controllerName,
                                    decoration: InputDecoration(
                                      hintText: "Nome",
                                      labelText: "Nome",
                                      suffixIcon:
                                          const Icon(Icons.person_2_outlined),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                ColorPallete.backgroundColor2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                ColorPallete.backgroundColor2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                ColorPallete.backgroundColor2,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme:
                                  Theme.of(context).colorScheme.copyWith(
                                        primary: ColorPallete.backgroundColor2,
                                      ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: controllerEmail,
                              decoration: InputDecoration(
                                hintText: "Email",
                                labelText: "Email",
                                suffixIcon:
                                    const Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorPallete.backgroundColor2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorPallete.backgroundColor2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorPallete.backgroundColor2,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme:
                                  Theme.of(context).colorScheme.copyWith(
                                        primary: ColorPallete.backgroundColor2,
                                      ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: controllerPassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                labelText: "Password",
                                suffixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorPallete.backgroundColor2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorPallete.backgroundColor2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorPallete.backgroundColor2,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  fieldValidation();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorPallete.backgroundColor2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    userRegister ? "Register" : "Login",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text("Login"),
                              Switch(
                                value: userRegister,
                                onChanged: (bool value) {
                                  setState(() {
                                    userRegister = value;
                                  });
                                },
                              ),
                              const Text("Register"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
