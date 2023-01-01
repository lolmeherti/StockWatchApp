//
//  TickerQuoteViewModel.swift
//  StockWatchApp
//
//  Created by Alex H. on 01.01.23.
//

import Foundation
import SwiftUI
import StockWatch

@MainActor
class TickerQuoteViewModel: ObservableObject {
    
    @Published var phase = FetchPhase<Quote>.initial
    var quote: Quote? { phase.value }
    var error: Error? { phase.error }
    
    let ticker: Ticker
    let stocksAPI: StocksAPI
    
    init(ticker: Ticker, stocksAPI: StocksAPI = StockWatch()) {
        self.ticker = ticker
        self.stocksAPI = stocksAPI
    }
    
    func fetchQuote() async {
        phase = .fetching
        
        do {
            let response = try await stocksAPI.fetchQuotes(symbols: ticker.symbol)
            if let quote = response.first {
                phase = .success(quote)
            } else {
                phase = .empty
            }
        } catch {
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
    
}
