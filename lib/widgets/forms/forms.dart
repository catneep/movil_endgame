import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Form fields
          const _FormField(label: "Username"),
          const _FormField(label: "Password", obscured: true),

          // Submit button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () => _registerFormValidator(_formKey),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Form fields
          const _FormField(label: "Username"),
          const _FormField(label: "Password", obscured: true),

          Transform.scale(
            scale: 0.66,
            child: _FormCheckbox(label: "Recordar mis datos",),
          ),

          // Submit button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () => _sessionFormValidator(_formKey),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Template widget that handle basic form entries
///
/// args:
///   - String label: field's initial value
///   - bool obscured: whether the field handles a password or not (false by default)
///   - bool isRequired: whether the field can be empty or not (true by default)
///
/// return:
///   - TextFormField()
class _FormField extends StatelessWidget {
  final bool obscured, isRequired;
  final String label, requiredMsg;

  const _FormField(
      {Key? key,
      required this.label,
      this.requiredMsg = 'Campo requerido',
      this.obscured = false,
      this.isRequired = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        minLines: 1,
        maxLines: 1,
        // initialValue: label,
        decoration: InputDecoration(hintText: label),
        obscureText: obscured,
        validator: (isRequired)
            ? (value) {
                if (value == null || value.isEmpty) {
                  return requiredMsg;
                }
                return null;
              }
            : (_) => null);
  }
}

/// Handles user registration
Future<void> _registerFormValidator(GlobalKey<FormState> key) async {
  // Validate returns true if the form is valid, or false otherwise.
  if (!key.currentState!.validate()) {
    debugPrint("something's wrong in register form my dood :(");
    return;
  }

  debugPrint('register form is good, man');
  return;
}

/// Handles user sign in
Future<void> _sessionFormValidator(GlobalKey<FormState> key) async {
  // Validate returns true if the form is valid, or false otherwise.
  if (!key.currentState!.validate()) {
    debugPrint("something's wrong in register form my dood :(");
    return;
  }

  debugPrint('register form is good, man');
  return;
}

/// This little guy really needs his own component to be
/// a competent widget 🙃
/// 
/// args:
///   - String label: Message that appears next to checkbox
/// return:
///   - CheckboxListTile()
// ignore: must_be_immutable
class _FormCheckbox extends StatefulWidget {
  final String label;
  bool ticked;
  _FormCheckbox({Key? key, required this.label, this.ticked= false})
      : super(key: key);

  @override
  State<_FormCheckbox> createState() => __FormCheckboxState();
}

class __FormCheckboxState extends State<_FormCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.label),
        value: widget.ticked,
        onChanged: (bool? value) {
          // handle checkbox tick
          (value != null) ? widget.ticked = value : null;

          // redraw in UI
          setState(() {});
        });
  }
}
