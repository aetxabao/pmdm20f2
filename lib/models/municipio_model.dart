import 'dart:convert';

import 'package:parla/models/votos_partido_model.dart';

Municipio municipioFromJson(String str) => Municipio.fromJson(json.decode(str));

String municipioToJson(Municipio data) => json.encode(data.toJson());

class Municipio {
  Municipio({
    this.codcir,
    this.codmun,
    this.municipio,
    this.field4,
    this.censo,
    this.certifAlta,
    this.censoTotal,
    this.votosTotales,
    this.votosNulos,
    this.votosBlancos,
    this.abstencion,
    this.votosValidos,
    this.votosCandidaturas,
    this.na,
    this.ehBildu,
    this.iEN,
    this.psnPsoe,
    this.gbai,
    this.sain,
    this.vox,
    this.equo,
    this.rcnNok,
    this.ln,
    this.podemos,
  });

  String codcir;
  dynamic codmun;
  String municipio;
  String field4;
  int censo;
  int certifAlta;
  int censoTotal;
  int votosTotales;
  int votosNulos;
  int votosBlancos;
  int abstencion;
  int votosValidos;
  int votosCandidaturas;
  int na;
  int ehBildu;
  int iEN;
  int psnPsoe;
  int gbai;
  int sain;
  int vox;
  int equo;
  int rcnNok;
  int ln;
  int podemos;

  factory Municipio.fromJson(Map<String, dynamic> json) => Municipio(
        codcir: json["Codcir"],
        codmun: json["Codmun"],
        municipio: json["Municipio"],
        field4: json["FIELD4"],
        censo: json["Censo"],
        certifAlta: json["Certif Alta"],
        censoTotal: json["Censo Total"],
        votosTotales: json["Votos Totales"],
        votosNulos: json["Votos Nulos"],
        votosBlancos: json["Votos Blancos"],
        abstencion: json["Abstención"],
        votosValidos: json["Votos Válidos"],
        votosCandidaturas: json["Votos Candidaturas"],
        na: json["NA+"],
        ehBildu: json["EH Bildu"],
        iEN: json["I-E (n)"],
        psnPsoe: json["PSN-PSOE"],
        gbai: json["GBAI"],
        sain: json["SAIN"],
        vox: json["VOX"],
        equo: json["EQUO"],
        rcnNok: json["RCN-NOK"],
        ln: json["Ln"],
        podemos: json["PODEMOS"],
      );

  Map<String, dynamic> toJson() => {
        "Codcir": codcir,
        "Codmun": codmun,
        "Municipio": municipio,
        "FIELD4": field4,
        "Censo": censo,
        "Certif Alta": certifAlta,
        "Censo Total": censoTotal,
        "Votos Totales": votosTotales,
        "Votos Nulos": votosNulos,
        "Votos Blancos": votosBlancos,
        "Abstención": abstencion,
        "Votos Válidos": votosValidos,
        "Votos Candidaturas": votosCandidaturas,
        "NA+": na,
        "EH Bildu": ehBildu,
        "I-E (n)": iEN,
        "PSN-PSOE": psnPsoe,
        "GBAI": gbai,
        "SAIN": sain,
        "VOX": vox,
        "EQUO": equo,
        "RCN-NOK": rcnNok,
        "Ln": ln,
        "PODEMOS": podemos,
      };

  List<VotosPartido> listaVotosPartido() {
    List<VotosPartido> data = [];
    if (psnPsoe > 0) data.add(new VotosPartido("Psn", psnPsoe));
    if (gbai > 0) data.add(new VotosPartido("gBai", gbai));
    if (podemos > 0) data.add(new VotosPartido("Pod", podemos));
    if (iEN > 0) data.add(new VotosPartido("IEn", iEN));
    if (ehBildu > 0) data.add(new VotosPartido("ehB", ehBildu));
    if (equo > 0) data.add(new VotosPartido("Eq", equo));
    if (rcnNok > 0) data.add(new VotosPartido("RN", rcnNok));
    if (ln > 0) data.add(new VotosPartido("Ln", ln));
    if (sain > 0) data.add(new VotosPartido("Sain", sain));
    if (na > 0) data.add(new VotosPartido("Na+", na));
    if (vox > 0) data.add(new VotosPartido("Vox", vox));
    //print(data.toString());
    return data;
  }

  bool ganaPartido(String partido) {
    switch (partido) {
      case "PSN-PSOE":
        return gana(psnPsoe);
      case "GBAI":
        return gana(gbai);
      case "EH Bildu":
        return gana(ehBildu);
      case "PODEMOS":
        return gana(podemos);
      case "I-E (n)":
        return gana(iEN);
      case "EQUO":
        return gana(equo);
      case "RCN-NOK":
        return gana(rcnNok);
      case "Ln":
        return gana(ln);
      case "SAIN":
        return gana(sain);
      case "NA+":
        return gana(na);
      case "VOX":
        return gana(vox);
      default:
        return false;
    }
  }

  bool gana(int v) {
    if (v >= na &&
        v >= ehBildu &&
        v >= iEN &&
        v >= psnPsoe &&
        v >= gbai &&
        v >= sain &&
        v >= vox &&
        v >= equo &&
        v >= rcnNok &&
        v >= ln &&
        v >= podemos) return true;
    return false;
  }
}
