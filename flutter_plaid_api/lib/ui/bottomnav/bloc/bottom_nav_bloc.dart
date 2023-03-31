import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:plaid_poc/data/plaid_repository.dart';
import 'package:plaid_poc/model/response/plaid_create_link_token_response.dart';
import 'package:plaid_poc/model/response/plaid_transactions_sync_response.dart';
import 'package:plaid_poc/model/transaction_ui_model.dart';
import 'package:plaid_poc/network/network_result.dart';

import '../../../common/plaid_properties.dart';
import '../../../model/response/plaid_exchange_public_token_response.dart';
import 'bottom_nav_bloc_event.dart';
import 'bottom_nav_bloc_state.dart';

class BottomNavBloc extends Bloc<BottomNavBlocEvent, BottomNavBlocState> {
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
          LinkConfiguration configuration = LinkTokenConfiguration(
            token: data.linkToken,
          );

          PlaidLink.open(configuration: configuration);

          await for (final plaidSuccess in PlaidLink.onSuccess) {
            plaidPublicToken = plaidSuccess.publicToken;

            final exchangeResponse = await exchangePublicToken();

            final dataExchangeResponse = exchangeResponse.data;

            if (dataExchangeResponse is ExchangePublicTokenResponse) {
              plaidAccessToken = dataExchangeResponse.accessToken;

              final transactionSyncResponse =
                  await getTransactionsSync();

              final dataTransactionSyncResponse = transactionSyncResponse.data;

              if (dataTransactionSyncResponse is TransactionsSyncResponse) {
                //print(dataTransactionSyncResponse.transactions);

                final transactions = dataTransactionSyncResponse.transactions
                    .map((e) => e.toUiModel());

                final list = transactions.toList();

                emit(state.copyWith(
                  transactions: list,
                ));
              }
            } else if (dataExchangeResponse is ResultError) {
              // show custom or general error
            } else {
              //show general error
            }
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
          transactions: [],
        ),
      );
    }
  }
}
