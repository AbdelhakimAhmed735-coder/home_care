import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/feature/account_setup/presentation/widgets/account_type.dart';

import 'account_setup_state.dart';

class AccountSetupCubit extends Cubit<AccountSetupState> {
  AccountSetupCubit() : super(const AccountSetupState());

  void selectAccountType(AccountType type) {
    emit(AccountSetupState(accountType: type));
  }
}
