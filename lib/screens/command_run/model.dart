import 'dart:convert';

CommandRunModel commandRunModelFromJson(String str) => CommandRunModel.fromJson(json.decode(str));

String commandRunModelToJson(CommandRunModel data) => json.encode(data.toJson());

class CommandRunModel {
    CommandRunModel({
        this.data,
    });

    Data? data;

    factory CommandRunModel.fromJson(Map<String, dynamic> json) => CommandRunModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.message,
        this.requestId,
        this.success,
        this.type,
    });

    String? message;
    String? requestId;
    bool? success;
    String? type;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        requestId: json["request_id"],
        success: json["success"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "request_id": requestId,
        "success": success,
        "type": type,
    };
}
