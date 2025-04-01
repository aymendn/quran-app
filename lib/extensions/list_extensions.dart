extension MakeListExt on Object {
  List<T> makeList<T>([int lenght = 10]) {
    return List.generate(lenght, (index) => this as T);
  }
}