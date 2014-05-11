part of services;



class AuthenticationService extends Service {



  @Procedure(filters: const [authFilter])
  Future<AuthenticationResponse> auth(MyFancyContext context, AuthenticationRequest req) {
    return new Future.value(new AuthenticationResponse()..success = true);
  }


  @Procedure()
  Future logout(MyFancyContext context) {
    // Logout from session
    return new Future.value();
  }

}

