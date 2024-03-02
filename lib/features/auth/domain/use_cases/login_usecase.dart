import 'package:TryOn/core/resources/data_state.dart';
import 'package:TryOn/core/use_cases/use_cases.dart';
import 'package:TryOn/features/auth/domain/repositories/login_repo.dart';

class GetLoginUseCases implements UseCases<DataState, void> {
  final LoginRepo _loginRepositories;

  GetLoginUseCases(this._loginRepositories);
  @override
  Future<DataState> call({void params}) {
    return _loginRepositories.login();
  }
}
