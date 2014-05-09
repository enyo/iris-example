part of services;






class UserService extends Service {



  @Route(filters: const [authFilter])
  Future<User> search(MyFancyContext context, UserSearch req) {
    return new Future.value(
        new User()
            ..email = "eee@mail.com"
            ..name = "test name"
        );
  }


}

