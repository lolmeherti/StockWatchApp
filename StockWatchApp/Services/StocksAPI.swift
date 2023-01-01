//
//  StocksAPI.swift
//  StockWatchApp
//
//  Created by Alex H. on 01.01.23.
//

import Foundation
import StockWatch

protocol StocksAPI {
    func searchTickers(query: String, isEquityTypeOnly: Bool) async throws -> [Ticker]
    func fetchQuotes(symbols: String) async throws -> [Quote]
    func fetchChartData(tickerSymbol: String, range: ChartRange) async throws -> ChartData?
}

extension StockWatch: StocksAPI {}
