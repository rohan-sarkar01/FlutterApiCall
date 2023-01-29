import 'dart:convert';
ChargeStateModel chargeStateModelFromJson(String str) => ChargeStateModel.fromJson(json.decode(str));
String chargeStateModelToJson(ChargeStateModel data) => json.encode(data.toJson());

class ChargeStateModel {
    ChargeStateModel({
        this.data,
    });

    Data? data;

    factory ChargeStateModel.fromJson(Map<String, dynamic> json) => ChargeStateModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.cType,
        this.chargeState,
        this.cpState,
        this.loc,
        this.rssi,
        this.timestamp,
        this.type,
        this.vol,
        this.wcred,
    });

    int? cType;
    int? chargeState;
    bool? cpState;
    List<dynamic>? loc;
    int? rssi;
    int? timestamp;
    String? type;
    double? vol;
    List<String>? wcred;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        cType: json["c_type"],
        chargeState: json["charge_state"],
        cpState: json["cp_state"],
        loc: json["loc"] == null ? [] : List<dynamic>.from(json["loc"]!.map((x) => x)),
        rssi: json["rssi"],
        timestamp: json["timestamp"],
        type: json["type"],
        vol: json["vol"]?.toDouble(),
        wcred: json["wcred"] == null ? [] : List<String>.from(json["wcred"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "c_type": cType,
        "charge_state": chargeState,
        "cp_state": cpState,
        "loc": loc == null ? [] : List<dynamic>.from(loc!.map((x) => x)),
        "rssi": rssi,
        "timestamp": timestamp,
        "type": type,
        "vol": vol,
        "wcred": wcred == null ? [] : List<dynamic>.from(wcred!.map((x) => x)),
    };
}
