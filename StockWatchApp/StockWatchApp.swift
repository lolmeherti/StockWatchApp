//
//  StockWatchAppApp.swift
//  StockWatchApp
//
//  Created by Alex H. on 31.12.22.
//

import SwiftUI

@main
struct StockWatchApp: App {
    
    @StateObject var appVM = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack
            {
                MainListView()
            }
            .environmentObject(appVM)
        }
    }
}
