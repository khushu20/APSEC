import 'package:ap_sec/network/base_apiclient.dart';
import 'package:flutter/material.dart';
import '../models/downloadSlipVoterResponse.dart';
import '../network/api_constant.dart';

class VoterSlipRepository {
  final BaseApiClient _baseApiClient = BaseApiClient();
  VoterResponse? responseVoterSlip;
  Future<VoterResponse?> getVoterSlipTelugu(
      BuildContext context,dynamic body) async {
    final response = await _baseApiClient.postCall(
      context,
      ApiConstants.baseUrlGAD,
      body,
    );
    print(response);
    final staticResponse = {
      "Status_Message": "Success",
      "Status_Code": "200",
      "electionTypeTitle_en": "Greater Hyderabad Muncipal Corporation",
      "electionTypeTitle_te": "గ్రేటర్ హైదరాబాద్ మున్సిపల్ కార్పొరేషన్",
      "sub_Title_en": "Voter Slip",
      "sub_Title_te": "ఓటరు స్లిప్",
      "note_en":
          "Note:- This voter slip will not be considered an identification document. Please carry EPIC card or anyone of 18 photo identification documents declared to cast your vote",
      "note_te":
          "గమనిక:- ఈ ఓటరు స్లిప్పు ఓటరు గుర్తింపు పత్రముగా పరిగణింపబడదు. ఎపిక్ కార్డుగాని, లేదా ప్రకటించిన 18 పోటో గుర్తింపు పత్రాలలో ఒక దానిని తప్పక పోలింగ్ స్టేషన్ కు తీసుకొని పోవలను.",
      "app_logo": "https://upload.wikimedia.org/wikipedia/en/9/92/Telangana_State_Election_Commission_Logo.png",
      "Voter_Data": [
        {
          "id": "1",
          "label_name_en": "District",
          "label_name_te": "జిల్లా",
          "value_en": "Hyderabad",
          "value_te": "హైదరాబాద్"
        },
        {
          "id": "2",
          "label_name_en": "Municipality/Corporation Name",
          "label_name_te": "నగర పాలక సంస్థ",
          "value_en": "GHMC",
          "value_te": " జిహెచ్ఎంసి"
        },
        {
          "id": "3",
          "label_name_en": "Ward No. and Name",
          "label_name_te": "వార్డ్ నెం. - పేరు",
          "value_en": "ward 1-kapra",
          "value_te": "వార్డ్ 1-కాప్రా"
        },
        {
          "id": "4",
          "label_name_en": "PS Location",
          "label_name_te": "పోలింగ్ కేంద్రం ప్రదేశం",
          "value_en": "class 5 kapra",
          "value_te": "తరగతి 5 కాప్రా"
        },
        {
          "id": "5",
          "label_name_en": "PS No.",
          "label_name_te": "పోలింగ్ కేంద్రం నంబర్",
          "value_en": "5",
          "value_te": "5"
        },
        {
          "id": "6",
          "label_name_en": "Voter PS Sl. No.",
          "label_name_te": "వరుస సంఖ్య",
          "value_en": "5",
          "value_te": "5"
        },
        {
          "id": "7",
          "label_name_en": "Name",
          "label_name_te": "ఓటరు పేరు",
          "value_en": "K Sathish Kumar",
          "value_te": "కె సతీష్ కుమార్"
        },
        {
          "id": "8",
          "label_name_en": "Father/Husband’s Name",
          "label_name_te": "తండ్రి/భర్త పేరు",
          "value_en": "K Sathya Narayana",
          "value_te": "కె సత్యనారాయణ"
        },
        {
          "id": "9",
          "label_name_en": "Age",
          "label_name_te": "వయస్సు",
          "value_en": "35",
          "value_te": "35"
        },
        {
          "id": "10",
          "label_name_en": "Gender",
          "label_name_te": "లింగము",
          "value_en": "M",
          "value_te": "ఎం"
        },
        {
          "id": "11",
          "label_name_en": "Door No.",
          "label_name_te": "ఇంటి నంబర్",
          "value_en": "16-1-337/1",
          "value_te": "16-1-337/1"
        },
        {
          "id": "12",
          "label_name_en": "EPIC No.",
          "label_name_te": "ఎపిక్ నంబర్",
          "value_en": "JJK5789680",
          "value_te": "JJK5789680"
        }
      ]
    };
    return VoterResponse.fromJson(staticResponse);
  }
}
