class MonthlyModel {
  final String month;
  final String firstYear;
  final String secondYear;
  final String difference;
  final String percentage;
  MonthlyModel({
    required this.month,
    required this.firstYear,
    required this.secondYear,
    required this.difference,
    required this.percentage,
  });

  List<String> get props => [
        month,
        firstYear,
        secondYear,
        difference,
        percentage,
      ];
}
