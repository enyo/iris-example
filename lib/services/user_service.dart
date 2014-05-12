part of services;


class UserService extends Service {



  @anno.Procedure(filters: const [authFilter])
  Future<User> search(MyFancyContext context, UserSearch req) {
    return new Future.value(
        new User()
            ..email = "eee@mail.com"
            ..name = "test name"
        );
  }


  @anno.Procedure()
  Future delete(MyFancyContext context, DeleteUser userDel) {
    // delete user with userDel.id
    return new Future.value();
  }

}

