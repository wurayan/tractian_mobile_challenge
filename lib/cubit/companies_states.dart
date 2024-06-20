part of 'companies_cubit.dart';


final class CompaniesState {}

final class CompaniesLoading extends CompaniesState {}

final class CompaniesSuccess extends CompaniesState {
  final List<CompanyModel> companies;
  CompaniesSuccess(this.companies);
}

final class CompaniesEmpty extends CompaniesState {
  final String msg;
  CompaniesEmpty(this.msg);
}

final class CompaniesError extends CompaniesState {
  final String msg;
  CompaniesError(this.msg);
}