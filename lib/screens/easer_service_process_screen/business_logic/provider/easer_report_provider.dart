
import '../../../../constants/enums/easer_report_enum.dart';
import '../../../../core/base_provider/base_provider.dart';

// this class for report pages to handle logic in screens
class EaserReportProvider extends BaseProvider {
  // init percent of  top progress bar
  double percent = 0.3;
  // inti percentage status to change title of button in the bottom section
  PercentageStatus percentageStatus = PercentageStatus.before;

  // init report Status Button as no button clicked "Base"
  ReportBtnStatus reportButton = ReportBtnStatus.base;


  // change value of percent progress bar when user move to the next Page .
  void changePercent(){
    if(percent + .3 < 1.0 ) {
      percent = percent + .3;
      if(percent > .3 && percent <= .6) {
        percentageStatus = PercentageStatus.after;
      }
      else if(percent > .6){
        percentageStatus = PercentageStatus.confirmation;
      }
      updateUi();
    }
  }

  void restPercent(){
    percentageStatus = PercentageStatus.before;
    percent = .3;
  }

 // change Report status and colored buttons "Yes" & "No"
  void isReporting(ReportBtnStatus status){
    reportButton = status;
    updateUi();
  }
  void changePercentBack(){
    double result = double.parse((percent - .3).toStringAsFixed(2));
    if(result > 0) {
      percent = result;
      if(percent > 0 && percent <= .3){
        percentageStatus = PercentageStatus.before;
      }
      else if(percent > .3 && percent <= .6) {
        percentageStatus = PercentageStatus.after;
      }
      else if(percent > .6 && percent <= .9 ){
        percentageStatus = PercentageStatus.confirmation;
      }
      updateUi();
    }
  }

}
