// To parse this JSON data, do
//
//     final verifyModel = verifyModelFromJson(jsonString);

import 'dart:convert';

VerifyModel verifyModelFromJson(String str) => VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
    VerifyModel({
        this.email,
        this.user,
        this.domain,
        this.smtpCheck,
        this.mxFound,
        this.didYouMean,
        this.role,
        this.disposable,
        this.score,
        this.free,
        this.formatValid,
        this.catchAll,
    });

    String? email;
    String? user;
    String? domain;
    bool? smtpCheck;
    bool? mxFound;
    String? didYouMean;
    bool? role;
    bool? disposable;
    double? score;
    bool? free;
    bool? formatValid;
    dynamic catchAll;

    factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        email: json["email"],
        user: json["user"],
        domain: json["domain"],
        smtpCheck: json["smtp_check"],
        mxFound: json["mx_found"],
        didYouMean: json["did_you_mean"],
        role: json["role"],
        disposable: json["disposable"],
        score: json["score"].toDouble(),
        free: json["free"],
        formatValid: json["format_valid"],
        catchAll: json["catch_all"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "user": user,
        "domain": domain,
        "smtp_check": smtpCheck,
        "mx_found": mxFound,
        "did_you_mean": didYouMean,
        "role": role,
        "disposable": disposable,
        "score": score,
        "free": free,
        "format_valid": formatValid,
        "catch_all": catchAll,
    };
}
