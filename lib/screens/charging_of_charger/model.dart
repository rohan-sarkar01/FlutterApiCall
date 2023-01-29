import 'dart:convert';

ChargingModel chargingModelFromJson(String str) => ChargingModel.fromJson(json.decode(str));

String chargingModelToJson(ChargingModel data) => json.encode(data.toJson());

class ChargingModel {
    ChargingModel({
        this.data,
    });

    Data? data;

    factory ChargingModel.fromJson(Map<String, dynamic> json) => ChargingModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.actpower,
        this.endReason,
        this.endTime,
        this.frq,
        this.pF,
        this.power,
        this.startTime,
        this.totalUsage,
        this.txStatus,
        this.txdId,
        this.type,
        this.userId,
        this.vol,
    });

    double? actpower;
    String? endReason;
    int? endTime;
    double? frq;
    double? pF;
    double? power;
    int? startTime;
    double? totalUsage;
    int? txStatus;
    String? txdId;
    String? type;
    String? userId;
    double? vol;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        actpower: json["actpower"],
        endReason: json["end_reason"],
        endTime: json["end_time"],
        frq: json["frq"],
        pF: json["p_f"],
        power: json["power"],
        startTime: json["start_time"],
        totalUsage: json["total_usage"]?.toDouble(),
        txStatus: json["tx_status"],
        txdId: json["txd_id"],
        type: json["type"],
        userId: json["user_id"],
        vol: json["vol"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "actpower": actpower,
        "end_reason": endReason,
        "end_time": endTime,
        "frq": frq,
        "p_f": pF,
        "power": power,
        "start_time": startTime,
        "total_usage": totalUsage,
        "tx_status": txStatus,
        "txd_id": txdId,
        "type": type,
        "user_id": userId,
        "vol": vol,
    };
}
