//
//  NewsApiResultsViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI
import Combine

//ViewModel для запроса списка новостей на NewsApi.org
//С пейджингом
class NewsApiResultsViewModel : NewsListViewModelProtocol {

    @Published var list: [NewsApiResult] = []
    @Published var canLoad: Bool = true

    var sourceId: String
    var sourceName: String
    private var page: Int = 1
    private var totalCount: Int = .max
    private let newsApi: NewsApiNetworkingProtocol.Type
    private var bag = Set<AnyCancellable>()

    init(withSource source: String,
         withSourceName sourceName: String,
         withApi newsApi: NewsApiNetworkingProtocol.Type = DIContainer.shared.resolve(type: NewsApiNetworkingProtocol.Type.self)!) {
        self.sourceId = source
        self.sourceName = sourceName
        self.newsApi = newsApi
    }

    func fetchData() {
        guard self.canLoad else {
            return
        }
        guard totalCount > self.list.count else {
            return
        }

        canLoad = false

        self
            .newsApi
            .fetchNewsApiResults(sources: self.sourceId,
                                         page: self.page,
                                         pageSize: 25)
            .sink {[weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                self?.canLoad = true
            } receiveValue: {[weak self] receivedData in
                self?.totalCount = receivedData.totalResults ?? .max
                self?.list.append(contentsOf: (receivedData.articles ?? []))
                self?.page += 1
            }
            .store(in: &self.bag)

    }
}
