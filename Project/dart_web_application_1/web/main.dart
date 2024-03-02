import 'dart:html';

void main() {
  List<Map<String, String>> users = [
    {"cnicno": "12345", "password": "12345"},
    {"cnicno": "13579", "password": "13579"},
    {"cnicno": "24680", "password": "24680"}
  ];

  FormElement loginForm = querySelector('#login-form') as FormElement;

  loginForm.onSubmit.listen((event) {
    event.preventDefault();

    String cnicno =
        (querySelector('#username') as InputElement?)?.value?.trim() ?? '';
    String password =
        (querySelector('#pass') as InputElement?)?.value?.trim() ?? '';

    bool isAuthenticated = authenticateUser(users, cnicno, password);

    if (isAuthenticated) {
      window.location.href = 'dashboard.html';
    } else {
      window.alert("Invalid Password");
    }
  });
}

bool authenticateUser(
    List<Map<String, String>> users, String cnicno, String password) {
  for (var user in users) {
    if (user['cnicno'] == cnicno && user['password'] == password) {
      return true;
    }
  }
  return false;
}
