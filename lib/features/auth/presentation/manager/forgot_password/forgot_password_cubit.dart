import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  static ForgotPasswordCubit get(context) => BlocProvider.of(context);

  void sendEmail() => emit(SendOtpState());

  void sendOtp() => emit(ResetPasswordState());

  void resetPassword() => emit(SuccessState());
}
