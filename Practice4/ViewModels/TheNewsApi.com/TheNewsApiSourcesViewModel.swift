//
//  NewsDocListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI
import Combine

//ViewModel для запроса списка источников новостей на TheNewsApi.com
//Без пейджинга
class TheNewsApiSourcesViewModel : ObservableObject, SourcesListViewModelProtocol {

    private let newsApi: NewsApiNetworkingProtocol.Type
    init(with newsApi: NewsApiNetworkingProtocol.Type = DIContainer.shared.resolve(type: NewsApiNetworkingProtocol.Type.self)!) {
        self.newsApi = newsApi
    }

    private var bag = Set<AnyCancellable>()
    @Published var list: [TheNewsApiSource] = []
    @Published var canLoad = false

    func fetchData() {
        guard self.canLoad else {
            return
        }

        self.canLoad = false
        self
            .newsApi
            .fetchTheNewsApiSources()
            .sink {[weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                self?.canLoad = true
            } receiveValue: {[weak self] receivedData in
                self?.list = receivedData.data ?? []
            }
            .store(in: &self.bag)

    }
}
