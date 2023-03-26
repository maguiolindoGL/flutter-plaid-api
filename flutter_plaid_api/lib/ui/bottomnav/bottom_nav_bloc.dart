import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:plaid_poc/data/plaid_repository.dart';
import 'package:plaid_poc/model/response/plaid_create_link_token_response.dart';
import 'package:plaid_poc/network/network_result.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc_event.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc_state.dart';

class BottomNavBloc extends Bloc<PlaidBlocEvent, BottomNavBlocState> {
  BottomNavBloc() : super(const BottomNavBlocState()) {
    on<InitScreenEvent>(_mapInitScreenEventToState);
  }

  void _mapInitScreenEventToState(
      InitScreenEvent event, Emitter<BottomNavBlocState> emit) async {
    try {
      final plaidResponse = await plaidCreateLinkToken();

      if (plaidResponse is ResultSuccess) {
        final data = plaidResponse.data;

        if (data is CreateLinkTokenResponse) {
          // emit(
          //   state.copyWith(
          //     sideEffect: StartPlaidLogin(data.linkToken),
          //   )
          // );

          LinkConfiguration configuration = LinkTokenConfiguration(
            token: data.linkToken,
          );

          PlaidLink.open(configuration: configuration);

          await for (final plaidSuccess in PlaidLink.onSuccess) {

          }
        }
      } else if (plaidResponse is ResultError) {
        // show custom or general error
      } else {
        //show general error
      }
    } catch (error) {
      emit(
        state.copyWith(
          accounts: [],
        ),
      );
    }
  }
}
