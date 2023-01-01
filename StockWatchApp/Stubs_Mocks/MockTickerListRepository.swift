//
//  MockTickerListRepository.swift
//  StockWatchApp
//
//  Created by Alex H. on 01.01.23.
//

import Foundation
import StockWatch

#if DEBUG
struct MockTickerListRepository: TickerListRepository {
    
    var stubbedLoad: (() async throws -> [Ticker])!
    func load() async throws -> [Ticker] {
        try await stubbedLoad()
    }
    
    func save(_ current: [Ticker]) async throws {}
    
}


#endif
