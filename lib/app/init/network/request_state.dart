sealed class RequestState {
  const RequestState();
}

class Idle extends RequestState {
  const Idle();
}

class Data<T> extends RequestState {
  final dynamic data;
  const Data(this.data);
}

class RError extends RequestState {
  final String message;
  const RError(this.message);
}

class Loading extends RequestState {
  const Loading();
}
