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

            .map({ receivedData -> [TheNewsApiSource] in
                return receivedData.data ?? []
            })
            .catch({ error -> Just<[TheNewsApiSource]> in
                print(error.localizedDescription)
                return Just([])
            })
            .assign(to: &self.$list)

//        DefaultAPI.theNewsApiSources { [weak self]  data, error in
//
//            if error == nil {
//                self?.list.append(contentsOf: (data?.data ?? []))
//            } else {
//                print("Error \(String(describing: error))")
//            }
//            self?.canLoad = true
//
//        }

    }
}
