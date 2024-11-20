
abstract class IUseCase<T, R extends dynamic> { 
  Future<T> execute(R payload);
}