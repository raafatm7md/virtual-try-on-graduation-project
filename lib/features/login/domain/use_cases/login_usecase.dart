import 'package:TryOn/core/resources/data_state.dart';
import 'package:TryOn/core/use_cases/use_cases.dart';
import 'package:TryOn/features/login/domain/repositories/login_repositories.dart';

class GetLoginUseCases implements UseCases<DataState, void> {
  final LoginRepositories _loginRepositories;

  GetLoginUseCases(this._loginRepositories);
  @override
  Future<DataState> call({void params}) {
    return _loginRepositories.login();
  }
}
