//
//  DateUtils.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import Foundation


func formatDate(_ dateString: String) -> String {
    let inputFormatter = ISO8601DateFormatter()
    let outputFormatter = DateFormatter()
    outputFormatter.dateStyle = .medium
    outputFormatter.timeStyle = .none
    
    if let date = inputFormatter.date(from: dateString) {
        return outputFormatter.string(from: date)
    }
    return "Unknown Date"
}
