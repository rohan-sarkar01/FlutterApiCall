import 'dart:convert';

PublishModel publishModelFromJson(String str) => PublishModel.fromJson(json.decode(str));
String publishModelToJson(PublishModel data) => json.encode(data.toJson());

class PublishModel {
    PublishModel({
        this.data,
    });

    String? data;

    factory PublishModel.fromJson(Map<String, dynamic> json) => PublishModel(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}
