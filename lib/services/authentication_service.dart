part of services;



class AuthenticationService extends Service {



  @Route(filters: const [authFilter])
  Future<AuthenticationResponse> auth(MyFancyContext context, AuthenticationRequest req) {
    return new Future.value(new AuthenticationResponse()..success = true);
  }


}

