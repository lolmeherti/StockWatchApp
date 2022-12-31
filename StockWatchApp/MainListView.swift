//
//  ContentView.swift
//  StockWatchApp
//
//  Created by Alex H. on 31.12.22.
//

import SwiftUI
import StockWatch


struct MainListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
