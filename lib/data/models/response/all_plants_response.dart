import 'package:hayat/data/models/response/plant_response.dart';

class AllPlantsResponse {
  List<PlantResponse>? data;
  Links? links;
  Meta? meta;

  AllPlantsResponse({this.data, this.links, this.meta});

  AllPlantsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PlantResponse>[];
      json['data'].forEach((v) {
        data!.add(new PlantResponse.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }

  void merge(AllPlantsResponse other) {
    data?.addAll(other.data ?? []);

    links = other.links;

    meta = other.meta;
  }
}

class Data {
  int? id;
  String? name;
  String? commonName;
  String? description;
  Kingdom? kingdom;
  Kingdom? phylum;
  Kingdom? plantclass;
  String? family;
  String? genus;
  String? species;
  String? mainImage;
  List<Null>? images;
  int? isActive;
  String? synonym;
  String? subspecies;
  String? native;
  String? environment;
  String? habitat;
  String? duration;
  String? cotyledon;
  String? abundance;
  String? stemHabit;
  String? plantLength;
  String? leafShape;
  String? generalDistribution;
  String? localDistribution;
  String? uses;
  String? references;
  List<CorollaColor>? corollaColor;

  Data(
      {this.id,
      this.name,
      this.commonName,
      this.description,
      this.kingdom,
      this.phylum,
      this.plantclass,
      this.family,
      this.genus,
      this.species,
      this.mainImage,
      this.images,
      this.isActive,
      this.synonym,
      this.subspecies,
      this.native,
      this.environment,
      this.habitat,
      this.duration,
      this.cotyledon,
      this.abundance,
      this.stemHabit,
      this.plantLength,
      this.leafShape,
      this.generalDistribution,
      this.localDistribution,
      this.uses,
      this.references,
      this.corollaColor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    commonName = json['common_name'];
    description = json['description'];
    kingdom =
        json['kingdom'] != null ? new Kingdom.fromJson(json['kingdom']) : null;
    phylum =
        json['phylum'] != null ? new Kingdom.fromJson(json['phylum']) : null;
    plantclass = json['plantclass'] != null
        ? new Kingdom.fromJson(json['plantclass'])
        : null;
    family = json['family'];
    genus = json['genus'];
    species = json['species'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = <Null>[];
    }
    isActive = json['is_active'];
    synonym = json['synonym'];
    subspecies = json['subspecies'];
    native = json['native'];
    environment = json['environment'];
    habitat = json['habitat'];
    duration = json['duration'];
    cotyledon = json['cotyledon'];
    abundance = json['abundance'];
    stemHabit = json['stem_habit'];
    plantLength = json['plant_length'];
    leafShape = json['leaf_shape'];
    generalDistribution = json['general_distribution'];
    localDistribution = json['local_distribution'];
    uses = json['uses'];
    references = json['references'];
    if (json['corolla_color'] != null) {
      corollaColor = <CorollaColor>[];
      json['corolla_color'].forEach((v) {
        corollaColor!.add(new CorollaColor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['common_name'] = this.commonName;
    data['description'] = this.description;
    if (this.kingdom != null) {
      data['kingdom'] = this.kingdom!.toJson();
    }
    if (this.phylum != null) {
      data['phylum'] = this.phylum!.toJson();
    }
    if (this.plantclass != null) {
      data['plantclass'] = this.plantclass!.toJson();
    }
    data['family'] = this.family;
    data['genus'] = this.genus;
    data['species'] = this.species;
    data['main_image'] = this.mainImage;
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    data['is_active'] = this.isActive;
    data['synonym'] = this.synonym;
    data['subspecies'] = this.subspecies;
    data['native'] = this.native;
    data['environment'] = this.environment;
    data['habitat'] = this.habitat;
    data['duration'] = this.duration;
    data['cotyledon'] = this.cotyledon;
    data['abundance'] = this.abundance;
    data['stem_habit'] = this.stemHabit;
    data['plant_length'] = this.plantLength;
    data['leaf_shape'] = this.leafShape;
    data['general_distribution'] = this.generalDistribution;
    data['local_distribution'] = this.localDistribution;
    data['uses'] = this.uses;
    data['references'] = this.references;
    if (this.corollaColor != null) {
      data['corolla_color'] =
          this.corollaColor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kingdom {
  int? id;
  String? title;

  Kingdom({this.id, this.title});

  Kingdom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class CorollaColor {
  int? id;
  String? title;
  String? adminName;
  String? image;
  Pivot? pivot;

  CorollaColor({this.id, this.title, this.adminName, this.image, this.pivot});

  CorollaColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    adminName = json['admin_name'];
    image = json['image'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['admin_name'] = this.adminName;
    data['image'] = this.image;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? plantId;
  int? colorId;

  Pivot({this.plantId, this.colorId});

  Pivot.fromJson(Map<String, dynamic> json) {
    plantId = json['plant_id'];
    colorId = json['color_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plant_id'] = this.plantId;
    data['color_id'] = this.colorId;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class LinksInsideMeta {
  String? url;
  String? label;
  bool? active;

  LinksInsideMeta({this.url, this.label, this.active});

  LinksInsideMeta.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
