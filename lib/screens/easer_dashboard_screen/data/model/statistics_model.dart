import 'dart:core';

class StatisticsModel{
   final double percent;
   final String title;

  StatisticsModel({required  this.percent,required this.title});

}

List<StatisticsModel> statistics = [
   StatisticsModel(percent: 0.7,title: 'Assiduity'),
   StatisticsModel(percent: 0.5,title: 'Customer reviews'),
   StatisticsModel(percent: 0.1,title: 'Soft skills/Presentation'),
   StatisticsModel(percent: 0.9,title: 'Average premium'),
];
