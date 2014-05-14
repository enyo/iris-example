part of services;



class AuthenticationService extends Service {



  @anno.Procedure(filters: const [authFilter])
  Future<AuthenticationResponse> auth(Ctx context, AuthenticationRequest req) {
    return new Future.value(new AuthenticationResponse()..success = true);
  }


  @anno.Procedure()
  Future logout(Ctx context) {
    // Logout from session
    return new Future.value();
  }

}

