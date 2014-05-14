part of services;


class UserService extends Service {



  @anno.Procedure(filters: const [authFilter])
  Future<User> search(Ctx context, UserSearch req) {
    return new Future.value(
        new User()
            ..email = "eee@mail.com"
            ..name = "test name"
        );
  }


  @anno.Procedure()
  Future delete(Ctx context, DeleteUser userDel) {
    // delete user with userDel.id
    return new Future.value();
  }


  @anno.Procedure()
  Future invalidProcedure(Ctx context) {
    throw new ProcedureException(ErrorCode.NO_USER_SUBMITTED, "This is a test error message sent from the server.");
  }

}

