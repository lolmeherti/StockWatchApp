//
//  TicketListRowData.swift
//  StockWatchApp
//
//  Created by Alex H. on 31.12.22.
//

import Foundation

typealias PriceChange = (price: String, change: String)

struct TickerListRowData
{
    enum RowType
    {
        case main
        case search(isSaved: Bool, onButtonTapped: () ->())
    }
    
    let symbol: String
    let name: String?
    let price: PriceChange?
    let type: RowType
    
}
