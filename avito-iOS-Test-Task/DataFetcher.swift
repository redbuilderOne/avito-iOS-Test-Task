//
//  DataFetcher.swift
//  avito-iOS-Test-Task
//
//  Created by Дмитрий Скворцов on 02.01.2023.
//

import Foundation
import Combine

enum URLEnum: String {
    case avitoURL = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
}

class DataFetcher {

    static let shared = DataFetcher()

    let url = URL(string: URLEnum.avitoURL.rawValue)

    func fetchData() -> AnyPublisher<[Result], Never> {
        guard let url = url else {
            return Just([]).eraseToAnyPublisher()
        }

        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [Result].self, decoder: JSONDecoder())
            .catch ({ _ in
                Just([])
            })
                .eraseToAnyPublisher()
                    return publisher
    }

}
