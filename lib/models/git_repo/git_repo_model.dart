// To parse this JSON data, do
//
//     final gitRepoModel = gitRepoModelFromJson(jsonString);

import 'dart:convert';

GitRepoModel gitRepoModelFromJson(String str) => GitRepoModel.fromJson(json.decode(str));

String gitRepoModelToJson(GitRepoModel data) => json.encode(data.toJson());

class GitRepoModel {
  int? totalCount;
  String? incompleteResults;
  List<RepoItem>? items;

  GitRepoModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory GitRepoModel.fromJson(Map<String, dynamic> json) => GitRepoModel(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"]?.toString(),
    items: json["items"] == null ? [] : List<RepoItem>.from(json["items"]!.map((x) => RepoItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class RepoItem {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  String? private;
  Owner? owner;
  List<String>? topics;
  String? visibility;
  String? forks;
  String? openIssues;
  String? watchers;
  String? defaultBranch;
  String? score;
  String? description;
  String? updatedAt;
  String? htmlUrl;

  RepoItem({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
    this.description,
    this.updatedAt,
    this.htmlUrl
  });

  factory RepoItem.fromJson(Map<String, dynamic> json) => RepoItem(
    id: json["id"],
    nodeId: json["node_id"]?.toString(),
    name: json["name"]?.toString(),
    fullName: json["full_name"]?.toString(),
    private: json["private"]?.toString(),
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    topics: json["topics"] == null ? [] : List<String>.from(json["topics"]!.map((x) => x)),
    visibility: json["visibility"]?.toString(),
    forks: json["forks"]?.toString(),
    openIssues: json["open_issues"]?.toString(),
    watchers: json["watchers"]?.toString(),
    defaultBranch: json["default_branch"]?.toString(),
    score: json["score"]?.toString(),
    description: json["description"]?.toString(),
    updatedAt: json["updated_at"]?.toString(),
    htmlUrl: json["html_url"]?.toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner?.toJson(),
    "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
    "visibility": visibility,
    "forks": forks,
    "open_issues": openIssues,
    "watchers": watchers,
    "default_branch": defaultBranch,
    "score": score,
  };
}

class Owner {
  String? login;
  String? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  String? userViewType;
  bool? siteAdmin;


  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"]?.toString(),
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    userViewType: json["user_view_type"],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": type,
    "user_view_type": userViewType,
    "site_admin": siteAdmin,
  };
}
