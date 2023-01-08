# StockWatchApp
Stock-Watcher App Swift+SwiftUI and Yahoo!Finance as an API

### Searching for tickers

You can search for tickers in the search bar and add them to your watchlist by tapping the add button in front of the ticker name

Any ticker that is on Yahoo!Finance can be searched for and added to the watchlist

Example of adding a ticker to the watchlist

<img src="https://github.com/lolmeherti/StockWatchApp/blob/main/gifs/save_your_tickers.gif" height="600" width="300">

### Chart

Tapping on an added ticker will slide up a chart sheet

The chart sheet has preset time filters as well as a more detailed view

Tapping or sliding on the chart will clearly show the exact value of the ticker at the selected point in time

<img src="https://github.com/lolmeherti/StockWatchApp/blob/main/gifs/check_values.gif" height="600" width="300">

### Removing tickers

Removing tickers from the watchlist is done by sliding a selected ticker slightly towards the left and tappin the delete button when its revealed

<img src="https://github.com/lolmeherti/StockWatchApp/blob/main/gifs/remove_tickers.gif" height="600" width="300">


### Dependencies

This app uses the swift package <a href="https://github.com/lolmeherti/StockWatchAPI" target="_blank">StockWatchAPI</a>, one of my repositories on this account and implements it as a dependency

The <a href="https://github.com/lolmeherti/StockWatchAPI" target="_blank">StockWatchAPI</a> uses the official Yahoo!Finance API to send and receive requests
