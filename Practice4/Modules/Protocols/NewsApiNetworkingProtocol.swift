//
//  NewsApi.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 07.06.2022.
//

import Foundation
import Combine

typealias NewsApiSourcesResult = (Result<NewsApiSources?, Error>) -> Void
typealias NewsApiResultsResult = (Result<NewsApiResults?, Error>) -> Void
typealias TheNewsApiSourcesResult = (Result<TheNewsApiSources?, Error>) -> Void
typealias TheNewsApiResultsResult = (Result<TheNewsApiResults?, Error>) -> Void

protocol NewsApiNetworkingProtocol {

    static func fetchTheNewsApiSources() -> Future<TheNewsApiSources, Error>
    static func fetchTheNewsApiResults(page: Int,
                                       domains: String,
                                       limit: Int) -> Future<TheNewsApiResults, Error>
    static func fetchNewsApiSources() -> Future<NewsApiSources, Error>
    static func fetchNewsApiResults(sources: String,
                                    page: Int,
                                    pageSize: Int) -> Future<NewsApiResults, Error>

}
