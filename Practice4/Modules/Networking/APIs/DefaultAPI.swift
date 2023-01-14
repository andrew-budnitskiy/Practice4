//
// DefaultAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire
import Practice3Package
import Combine

open class DefaultAPI {
    /**
     Get news list

     - parameter sources: (query)  
     - parameter page: (query)  
     - parameter pageSize: (query)  (optional, default to 25)
     - parameter apiKey: (query)  (optional, default to c74e894ef21646e28347927d57a85b87)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func newsApiResults(sources: String,
                                   page: Int,
                                   pageSize: Int? = 25,
                                   apiKey: String? = "c74e894ef21646e28347927d57a85b87",
                                   completion: @escaping ((_ data: NewsApiResults?,
                                                           _ error: Error?) -> Void)) {
        newsApiResultsWithRequestBuilder(sources: sources, page: page, pageSize: pageSize, apiKey: apiKey).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get news list
     - GET /newsapi.org/v2/everything
     - 

     - examples: [{contentType=application/json, example=[ {
  "totalResults" : 0,
  "articles" : [ {
    "publishedAt" : "2000-01-23T04:56:07.000+00:00",
    "author" : "author",
    "urlToImage" : "urlToImage",
    "description" : "description",
    "source" : {
      "name" : "name",
      "id" : "id"
    },
    "title" : "title",
    "url" : "url",
    "content" : "content"
  }, {
    "publishedAt" : "2000-01-23T04:56:07.000+00:00",
    "author" : "author",
    "urlToImage" : "urlToImage",
    "description" : "description",
    "source" : {
      "name" : "name",
      "id" : "id"
    },
    "title" : "title",
    "url" : "url",
    "content" : "content"
  } ],
  "status" : "status"
}, {
  "totalResults" : 0,
  "articles" : [ {
    "publishedAt" : "2000-01-23T04:56:07.000+00:00",
    "author" : "author",
    "urlToImage" : "urlToImage",
    "description" : "description",
    "source" : {
      "name" : "name",
      "id" : "id"
    },
    "title" : "title",
    "url" : "url",
    "content" : "content"
  }, {
    "publishedAt" : "2000-01-23T04:56:07.000+00:00",
    "author" : "author",
    "urlToImage" : "urlToImage",
    "description" : "description",
    "source" : {
      "name" : "name",
      "id" : "id"
    },
    "title" : "title",
    "url" : "url",
    "content" : "content"
  } ],
  "status" : "status"
} ]}]
     - parameter sources: (query)  
     - parameter page: (query)  
     - parameter pageSize: (query)  (optional, default to 25)
     - parameter apiKey: (query)  (optional, default to c74e894ef21646e28347927d57a85b87)

     - returns: RequestBuilder<NewsApiResults>
     */
    open class func newsApiResultsWithRequestBuilder(sources: String,
                                                     page: Int,
                                                     pageSize: Int? = nil,
                                                     apiKey: String? = nil) -> RequestBuilder<NewsApiResults> {
        let path = "/newsapi.org/v2/everything"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "sources": sources, 
                        "page": page.encodeToJSON(), 
                        "pageSize": pageSize?.encodeToJSON(), 
                        "apiKey": apiKey
        ])


        let requestBuilder: RequestBuilder<NewsApiResults>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get news sources list

     - parameter apiKey: (query)  (optional, default to c74e894ef21646e28347927d57a85b87)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func newsApiSources(apiKey: String? = "c74e894ef21646e28347927d57a85b87",
                                   completion: @escaping ((_ data: NewsApiSources?,
                                                           _ error: Error?) -> Void)) {
        newsApiSourcesWithRequestBuilder(apiKey: apiKey).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get news sources list
     - GET /newsapi.org/v2/top-headlines/sources
     - 

     - examples: [{contentType=application/json, example=[ {
  "sources" : [ {
    "country" : "country",
    "name" : "name",
    "description" : "description",
    "language" : "language",
    "id" : "id",
    "category" : "category",
    "url" : "url"
  }, {
    "country" : "country",
    "name" : "name",
    "description" : "description",
    "language" : "language",
    "id" : "id",
    "category" : "category",
    "url" : "url"
  } ],
  "status" : "status"
}, {
  "sources" : [ {
    "country" : "country",
    "name" : "name",
    "description" : "description",
    "language" : "language",
    "id" : "id",
    "category" : "category",
    "url" : "url"
  }, {
    "country" : "country",
    "name" : "name",
    "description" : "description",
    "language" : "language",
    "id" : "id",
    "category" : "category",
    "url" : "url"
  } ],
  "status" : "status"
} ]}]
     - parameter apiKey: (query)  (optional, default to c74e894ef21646e28347927d57a85b87)

     - returns: RequestBuilder<[NewsApiSources]> 
     */
    open class func newsApiSourcesWithRequestBuilder(apiKey: String? = nil) -> RequestBuilder<NewsApiSources> {
        let path = "/newsapi.org/v2/top-headlines/sources"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "apiKey": apiKey
        ])


        let requestBuilder: RequestBuilder<NewsApiSources>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get the newsApi results list

     - parameter page: (query)  
     - parameter limit: (query)  
     - parameter apiToken: (query)  (optional, default to wVTpnmkmnAQudIaFoRgqZhyNcCMlbsA6Fd8fDR6i)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func theNewsApiResults(page: Int,
                                      limit: Int? = 25,
                                      domains: String,
                                      apiToken: String? = "wVTpnmkmnAQudIaFoRgqZhyNcCMlbsA6Fd8fDR6i",
                                      completion: @escaping ((_ data: TheNewsApiResults?,
                                                              _ error: Error?) -> Void)) {
        theNewsApiResultsWithRequestBuilder(page: page,
                                            limit: limit,
                                            domains: domains,
                                            apiToken: apiToken).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get the newsApi results list
     - GET /api.thenewsapi.com/v1/news/all
     - 

     - examples: [{contentType=application/json, example=[ {
  "data" : [ {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  }, {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  } ],
  "meta" : {
    "found" : 0,
    "limit" : 1,
    "page" : 5,
    "returned" : 6
  }
}, {
  "data" : [ {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  }, {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  } ],
  "meta" : {
    "found" : 0,
    "limit" : 1,
    "page" : 5,
    "returned" : 6
  }
} ]}]
     - parameter page: (query)  
     - parameter limit: (query)  
     - parameter apiToken: (query)  (optional, default to wVTpnmkmnAQudIaFoRgqZhyNcCMlbsA6Fd8fDR6i)

     - returns: RequestBuilder<TheNewsApiSources>
     */
    open class func theNewsApiResultsWithRequestBuilder(page: Int,
                                                        limit: Int?,
                                                        domains: String,
                                                        apiToken: String? = nil) -> RequestBuilder<TheNewsApiResults> {
        let path = "/api.thenewsapi.com/v1/news/all"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "api_token": apiToken,
                        "domains": domains,
                        "page": page.encodeToJSON(), 
                        "limit": limit?.encodeToJSON()
        ])


        let requestBuilder: RequestBuilder<TheNewsApiResults>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    /**
     Get the newsApi sources list

     - parameter apiToken: (query)  (optional, default to wVTpnmkmnAQudIaFoRgqZhyNcCMlbsA6Fd8fDR6i)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func theNewsApiSources(apiToken: String? = "wVTpnmkmnAQudIaFoRgqZhyNcCMlbsA6Fd8fDR6i",
                                      completion: @escaping ((_ data: TheNewsApiSources?,
                                                              _ error: Error?) -> Void)) {
        theNewsApiSourcesWithRequestBuilder(apiToken: apiToken).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get the newsApi sources list
     - GET /api.thenewsapi.com/v1/news/sources
     - 

     - examples: [{contentType=application/json, example=[ {
  "data" : [ {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  }, {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  } ],
  "meta" : {
    "found" : 0,
    "limit" : 1,
    "page" : 5,
    "returned" : 6
  }
}, {
  "data" : [ {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  }, {
    "domain" : "domain",
    "language" : "language",
    "source_id" : "source_id",
    "categories" : [ "categories", "categories" ],
    "locale" : "locale"
  } ],
  "meta" : {
    "found" : 0,
    "limit" : 1,
    "page" : 5,
    "returned" : 6
  }
} ]}]
     - parameter apiToken: (query)  (optional, default to wVTpnmkmnAQudIaFoRgqZhyNcCMlbsA6Fd8fDR6i)

     - returns: RequestBuilder<TheNewsApiSources>
     */
    open class func theNewsApiSourcesWithRequestBuilder(apiToken: String? = nil) -> RequestBuilder<TheNewsApiSources> {
        let path = "/api.thenewsapi.com/v1/news/sources"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "api_token": apiToken
        ])


        let requestBuilder: RequestBuilder<TheNewsApiSources>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}

extension DefaultAPI: NewsApiNetworkingProtocol {

    static func fetchTheNewsApiSources() -> Future<TheNewsApiSources, Error> {

        return Future { promise in

            DefaultAPI.theNewsApiSources { data, error in

                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data!))
                }

            }

        }

    }

    static func fetchNewsApiSources() ->Future<NewsApiSources, Error> {

        Future { promise in

            DefaultAPI.newsApiSources { data, error in

                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data!))
                }

            }

        }

    }

    static func fetchTheNewsApiResults(page: Int,
                                       domains: String,
                                       limit: Int = 25) -> Future<TheNewsApiResults, Error> {

        return Future { promise in

            DefaultAPI.theNewsApiResults(page: page,
                                         limit: limit,
                                         domains: domains) { data, error in

                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data!))
                }

            }

        }
    }

    static func fetchNewsApiResults(sources: String,
                                    page: Int,
                                    pageSize: Int = 25) -> Future<NewsApiResults, Error> {

        Future { promise in

            DefaultAPI.newsApiResults(sources: sources,
                                      page: page,
                                      pageSize: pageSize) { data, error in

                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data!))
                }
            }

        }

    }

}
