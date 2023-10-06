import 'dart:core';

class ApiConstants {
  ApiConstants._();
  static const String baseUrlGAD = uatUrl;

  static const String uatUrl = "https://uat5.cgg.gov.in/labourApp/";
  static const String liveUrl = "https://labourapp.cgg.gov.in/checkStatus/";
  static const String entrepreneurLogin = "entrepreneur/entrepreneurLogin";
  static const String officerLogin = "labourOfficer/officerLogin";
  static const String checkRegistrationStatus ="checkStatus/checkRegistrationStatus";
  static const String viewAcknowledge = "checkStatus/viewAcknowledgement";
  static const String viewApplication = "checkStatus/viewApplication";
  static const String inspectionReport = "checkStatus/downloadInspectionReport";
  static const String checkGrievanceStatus = "grievance/checkGrievanceStatus";
  static const String complaintTypes = "commonList/getComplaintTypes";
}
