//
//  TheNewsApiResultsViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI
import Combine

//ViewModel для запроса списка новостей на TheNewsApi.com
//С пейджингом
class TheNewsApiResultsViewModel : NewsListViewModelProtocol {

    @Published var list: [TheNewsApiResult] = []
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

        self.canLoad = false
        self
            .newsApi
            .fetchTheNewsApiResults(page: self.page,
                                    domains: self.sourceId,
                                    limit: 25)
            .map { receivedResults -> (meta: TheNewsApiSourcesMeta?, data: [TheNewsApiResult]?) in
                return (meta: receivedResults.meta, data: receivedResults.data)
            }
            .sink {[weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                self?.canLoad = true
            } receiveValue: {[weak self] receivedData in
                self?.totalCount = receivedData.meta?.found ?? .max
                self?.list.append(contentsOf: (receivedData.data ?? []))
                self?.page += 1
            }
            .store(in: &self.bag)

    }
}
