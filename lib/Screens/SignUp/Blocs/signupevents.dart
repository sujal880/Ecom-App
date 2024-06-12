abstract class SignUpEvents{}
class SignUpUser extends SignUpEvents{
  String email;
  String password;
  String username;
  SignUpUser({required this.password,required this.email,required this.username});
}