// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart';

class Brainly {
  String country_code = "id";
  /*
	id: 'https://brainly.co.id',
	us: 'https://brainly.com',
	es: 'https://brainly.lat',
	pt: 'https://brainly.com.br',
	ru: 'https://znanija.com',
	ro: 'https://brainly.ro',
	tr: 'https://eodev.com',
	ph: 'https://brainly.ph',
	pl: 'https://brainly.pl',
	hi: 'https://brainly.in',
	fr: 'https://nosdevoirs.fr',
*/
  Brainly([country_code_params]) {
    country_code = country_code_params ?? "id";
    country_code = country_code.toLowerCase();
  }

  Future<BrainlyResult> search(String query, {String? language_code, int count_result = 5}) async {
    var format_graphql = """query SearchQuery(\$query: String!, \$len: Int!) {\n  questionSearch(query: \$query, first: \$len, after: null) {\n    edges {\n      node {\n        id\n        databaseId\n        points\n        pointsForAnswer\n        pointsForBestAnswer\n        created\n        isClosed\n        content\n        author {\n          id\n          nick\n          receivedThanks\n          avatar {\n            url\n            thumbnailUrl\n          }\n          databaseId\n          description\n          helpedUsersCount\n          gender\n          created\n          specialRanks {\n            name\n          }\n          bestAnswersCount\n          answererLevel\n          points\n          rank {\n            name\n          }\n          friends {\n            count\n          }\n          answeringStreak {\n            pointsForToday\n            pointsForTomorrow\n            progressIncreasedToday\n            progress\n            canLotteryPointsBeClaimed\n          }\n          bestAnswersCountInLast30Days\n          questions {\n            count\n            edges {\n              node {\n                content\n                grade {\n                  name\n                }\n                subject {\n                  slug\n                }\n                points\n                pointsForBestAnswer\n                pointsForAnswer\n                isClosed\n                canBeAnswered\n                created\n                attachments {\n                  url\n                }\n                grade {\n                  name\n                }\n                eduLevel\n                answers {\n                  nodes {\n                    id\n                    databaseId\n                    content\n                    created\n                    isBest\n                    isConfirmed\n                    qualityScore\n                    points\n                    ratesCount\n                    verification {\n                      approval {\n                        approver {\n                          nick\n                          databaseId\n                        }\n                      }\n                    }\n                    attachments {\n                      url\n                    }\n                    canComment\n                    comments {\n                      count\n                      edges {\n                        node {\n                          databaseId\n                          deleted\n                          content\n                          author {\n                            id\n                            nick\n                            avatar {\n                              url\n                              thumbnailUrl\n                            }\n                            databaseId\n                            friends {\n                              count\n                            }\n                            receivedThanks\n                            points\n                            created\n                            description\n                          }\n                        }\n                      }\n                    }\n                  }\n                }\n              }\n            }\n          }\n        }\n        canBeAnswered\n        grade {\n          name\n        }\n        attachments {\n          url\n        }\n        lastActivity\n        subject {\n          slug\n        }\n        eduLevel\n        similar {\n          question {\n            content\n            author {\n              nick\n              avatar {\n                url\n                thumbnailUrl\n              }\n              id\n              databaseId\n              description\n              helpedUsersCount\n              gender\n              created\n              specialRanks {\n                name\n              }\n              bestAnswersCount\n              answererLevel\n              points\n              rank {\n                name\n              }\n              friends {\n                count\n              }\n              answeringStreak {\n                pointsForToday\n                pointsForTomorrow\n                progressIncreasedToday\n                progress\n                canLotteryPointsBeClaimed\n              }\n              bestAnswersCountInLast30Days\n              questions {\n                count\n                edges {\n                  node {\n                    content\n                    grade {\n                      name\n                    }\n                    subject {\n                      slug\n                    }\n                    points\n                    pointsForBestAnswer\n                    pointsForAnswer\n                    isClosed\n                    canBeAnswered\n                    created\n                    attachments {\n                      url\n                    }\n                    grade {\n                      name\n                    }\n                    eduLevel\n                    answers {\n                      nodes {\n                        id\n                        databaseId\n                        content\n                        created\n                        isBest\n                        isConfirmed\n                        points\n                        ratesCount\n                        verification {\n                          approval {\n                            approver {\n                              nick\n                              databaseId\n                            }\n                          }\n                        }\n                        attachments {\n                          url\n                        }\n                        canComment\n                        comments {\n                          count\n                          edges {\n                            node {\n                              content\n                              author {\n                                nick\n                                databaseId\n                                avatar {\n                                  url\n                                }\n                              }\n                            }\n                          }\n                        }\n                      }\n                    }\n                  }\n                }\n              }\n            }\n            id\n            databaseId\n            points\n            pointsForAnswer\n            pointsForBestAnswer\n            created\n            isClosed\n            canBeAnswered\n            grade {\n              name\n            }\n            eduLevel\n          }\n        }\n        content\n        answers {\n          hasVerified\n          nodes {\n            author {\n              receivedThanks\n              avatar {\n                url\n                thumbnailUrl\n              }\n              id\n              databaseId\n              description\n              helpedUsersCount\n              gender\n              created\n              specialRanks {\n                name\n              }\n              bestAnswersCount\n              answererLevel\n              points\n              rank {\n                name\n              }\n              friends {\n                count\n              }\n              answeringStreak {\n                pointsForToday\n                pointsForTomorrow\n                progressIncreasedToday\n                progress\n                canLotteryPointsBeClaimed\n              }\n              bestAnswersCountInLast30Days\n              questions {\n                count\n                edges {\n                  node {\n                    content\n                    grade {\n                      name\n                    }\n                    subject {\n                      slug\n                    }\n                    points\n                    pointsForBestAnswer\n                    pointsForAnswer\n                    isClosed\n                    canBeAnswered\n                    created\n                    attachments {\n                      url\n                    }\n                    grade {\n                      name\n                    }\n                    eduLevel\n                    answers {\n                      nodes {\n                        id\n                        databaseId\n                        content\n                        created\n                        isBest\n                        isConfirmed\n                        qualityScore\n                        points\n                        ratesCount\n                        verification {\n                          approval {\n                            approver {\n                              nick\n                              databaseId\n                            }\n                          }\n                        }\n                        attachments {\n                          url\n                        }\n                        canComment\n                        comments {\n                          count\n                          edges {\n                            node {\n                              id\n                              databaseId\n                              deleted\n                              content\n                              author {\n                                nick\n                                avatar {\n                                  url\n                                  thumbnailUrl\n                                }\n                                id\n                                databaseId\n                                friends {\n                                  count\n                                }\n                                receivedThanks\n                                points\n                                created\n                                description\n                              }\n                            }\n                          }\n                        }\n                      }\n                    }\n                  }\n                }\n              }\n            }\n            content\n            points\n            isBest\n            canComment\n            isConfirmed\n            qualityScore\n            thanksCount\n            ratesCount\n            comments {\n              edges {\n                node {\n                  id\n                  databaseId\n                  deleted\n                  content\n                  author {\n                    nick\n                    avatar {\n                      url\n                      thumbnailUrl\n                    }\n                    id\n                    databaseId\n                    friends {\n                      count\n                    }\n                    receivedThanks\n                    points\n                    created\n                    description\n                  }\n                }\n              }\n            }\n            attachments {\n              url\n            }\n          }\n        }\n      }\n    }\n  }\n}""";
    String url = "https://brainly.co.id/graphql/id";

    if (country_code == "") {}
    if (language_code != null) {
      language_code = language_code.toLowerCase();
    }

    Map data = {
      "operationName": "SearchQuery",
      "variables": {"query": query, "after": null, "len": count_result},
      "query": format_graphql
    };
    Response response = await post(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
      body: json.encode(data),
    );
    return BrainlyResult(response);
  }
}

class BrainlyResult {
  late int status_code;
  late Map body;
  BrainlyResult(Response result) {
    status_code = result.statusCode;
    try {
      body = json.decode(result.body);
    } catch (e) {}
  }
  get getRawJsonResult {
    return body;
  }
  get getJsonResult {
    return body;
  }
}