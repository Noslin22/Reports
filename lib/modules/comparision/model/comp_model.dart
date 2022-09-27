class CompModel {
  final String month;
  final String firstYear;
  final String secondYear;
  final String difference;
  final String percentage;
  final String difBudget;
  CompModel({
    required this.month,
    required this.firstYear,
    required this.secondYear,
    required this.difference,
    required this.percentage,
    required this.difBudget,
  });

  List<String> get props => [
        month,
        firstYear,
        secondYear,
        difference,
        percentage,
        difBudget,
      ];
}
