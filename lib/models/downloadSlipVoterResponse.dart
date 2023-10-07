class VoterResponse {
  String? statusMessage;
  String? statusCode;
  String? electionTypeTitleEn;
  String? electionTypeTitleTe;
  String? subTitleEn;
  String? subTitleTe;
  String? noteEn;
  String? noteTe;
  String? appLogo;
  List<VoterData>? voterData;

  VoterResponse(
      {this.statusMessage,
      this.statusCode,
      this.electionTypeTitleEn,
      this.electionTypeTitleTe,
      this.subTitleEn,
      this.subTitleTe,
      this.noteEn,
      this.noteTe,
      this.appLogo,
      this.voterData});

  VoterResponse.fromJson(Map<String, dynamic> json) {
    statusMessage = json['Status_Message'];
    statusCode = json['Status_Code'];
    electionTypeTitleEn = json['electionTypeTitle_en'];
    electionTypeTitleTe = json['electionTypeTitle_te'];
    subTitleEn = json['sub_Title_en'];
    subTitleTe = json['sub_Title_te'];
    noteEn = json['note_en'];
    noteTe = json['note_te'];
    appLogo = json['app_logo'];
    if (json['Voter_Data'] != null) {
      voterData = <VoterData>[];
      json['Voter_Data'].forEach((v) {
        voterData!.add(new VoterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status_Message'] = this.statusMessage;
    data['Status_Code'] = this.statusCode;
    data['electionTypeTitle_en'] = this.electionTypeTitleEn;
    data['electionTypeTitle_te'] = this.electionTypeTitleTe;
    data['sub_Title_en'] = this.subTitleEn;
    data['sub_Title_te'] = this.subTitleTe;
    data['note_en'] = this.noteEn;
    data['note_te'] = this.noteTe;
    data['app_logo'] = this.appLogo;
    if (this.voterData != null) {
      data['Voter_Data'] = this.voterData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VoterData {
  String? id;
  String? labelNameEn;
  String? labelNameTe;
  String? valueEn;
  String? valueTe;

  VoterData(
      {this.id,
      this.labelNameEn,
      this.labelNameTe,
      this.valueEn,
      this.valueTe});

  VoterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labelNameEn = json['label_name_en'];
    labelNameTe = json['label_name_te'];
    valueEn = json['value_en'];
    valueTe = json['value_te'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label_name_en'] = this.labelNameEn;
    data['label_name_te'] = this.labelNameTe;
    data['value_en'] = this.valueEn;
    data['value_te'] = this.valueTe;
    return data;
  }
}
