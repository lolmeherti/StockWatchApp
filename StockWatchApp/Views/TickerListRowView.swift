//
//  TickerListRowView.swift
//  StockWatchApp
//
//  Created by Alex H. on 31.12.22.
//

import SwiftUI

struct TickerListRowView: View
{
    let data: TickerListRowData
    
    var body: some View
    {
        HStack(alignment: .center)
        {
            if case let .search(isSaved,onButtonTapped) = data.type
            {
                Button {
                    onButtonTapped()
                } label: {
                    image(isSaved: isSaved)
                }
            }
            
            VStack(alignment: .leading, spacing: 8)
            {
                Text(data.symbol).font(.headline.bold())
                
                if let name = data.name
                {
                    Text(name)
                        .font(.subheadline)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
            }
            
            Spacer()
            
            if let (price, change) = data.price
            {
                VStack(alignment: .trailing, spacing: 4)
                {
                    Text(price)
                        .font(.headline.bold())
                    priceChangeView(value: change)
                }
                .font(.subheadline.bold())
            }
            
        }
        .padding()
    }
    
    @ ViewBuilder
    func image(isSaved: Bool) -> some View
    {
        if(isSaved)
        {
            Image(systemName: "checkmark.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color.white, Color.accentColor)
                .imageScale(.large)
        } else {
            Image(systemName: "plus.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color.white, Color.green.opacity(0.6))
                .imageScale(.large)
        }
    }
    
    @ ViewBuilder
    func priceChangeView(value: String) -> some View
    {
        if case .main = data.type
        {
            ZStack(alignment: .trailing)
            {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(value.hasPrefix("-") ? .red : .green)
                    .frame(height:24)
                
                Text(value)
                    .foregroundColor(.white)
                    .font(.caption.bold())
                    .padding(.horizontal, 8)
            }
            .fixedSize()
        } else {
            Text(value)
                .foregroundColor(value.hasPrefix("-") ? .red : .green)
        }
    }
    
}

struct TickerListRowView_Previews: PreviewProvider
{
    static var previews: some View
    {
        VStack(alignment: .leading)
        {
        
            Text("Main List").font(.largeTitle.bold()).padding()
            
            VStack
            {
               TickerListRowView(data: teslaTickerListRowData(rowType: .main))
                
                Divider()
                
               TickerListRowView(data: appleTickerListRowData(rowType: .main))
            }
            
            Text("Search List").font(.largeTitle.bold()).padding()
            
            VStack
            {
                TickerListRowView(data: teslaTickerListRowData(rowType: .search(isSaved: true, onButtonTapped: {})))
                
                Divider()
                
                TickerListRowView(data: appleTickerListRowData(rowType: .search(isSaved: false, onButtonTapped: {})))
            }
            .padding()
            
        }.previewLayout(.sizeThatFits)
    }
    
    static func teslaTickerListRowData(rowType: TickerListRowData.RowType) -> TickerListRowData
    {
        .init(symbol: "TSLA", name: "Tesla", price: ("250.9", "-18.5"), type: rowType)
    }
    
    static func appleTickerListRowData(rowType: TickerListRowData.RowType) -> TickerListRowData
    {
        .init(symbol: "AAPL", name: "Apple Inc.", price: ("100.0", "+0.7"), type: rowType)
    }
}
