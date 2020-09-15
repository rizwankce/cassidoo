/*
Given an array of numbers that represent stock prices (where each number is the price for a certain day), find 2 days when you should buy and sell your stock for the highest profit.
*/

// swift
func stockBuySell(_ prices: [Int]) -> String {
    var buy: Int = 0
    var sell: Int = 0
    var best: Int = 0
    var index = 0
    while index < prices.count {
        let current = prices[index]
        var j = index + 1
        while j < prices.count {
            let p = prices[j]
            if p - current > best {
                buy = index
                sell = j
                best = p - current
            }
            j += 1
        }
        index += 1
    }

    return "buy on day \(buy + 1), sell on day \(sell + 1)"
}

print(stockBuySell([110, 180, 260, 40, 310, 535, 695]))
