import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge_treeview/model/company_model.dart';
import 'package:tractian_challenge_treeview/service/api_rest.dart';

part 'companies_states.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(CompaniesLoading());

  final Api api = Api();

  Future<void> getCompanies() async {
    try {
      List<CompanyModel> companies = await api.getCompanies();
      companies.isEmpty
          ? emit(CompaniesEmpty("Companies list is empty!"))
          : emit(CompaniesSuccess(companies));
    } catch (e) {
      emit(CompaniesError(e.toString()));
    }
  }
}
