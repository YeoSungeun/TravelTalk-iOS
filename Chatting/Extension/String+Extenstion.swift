//
//  String+Extenstion.swift
//  Chatting
//
//  Created by 여성은 on 6/3/24.
//

import UIKit

extension String {
    
    static func formatDateTravelTalk(_ date: String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateformatter.date(from: date)// Date로 변환

        dateformatter.dateFormat = "yy.MM.dd"
        let dateString = dateformatter.string(from: date ?? Date()) // Date String으로 변환

        return dateString
    }
    
    func formatDateChat(date: String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateformatter.date(from: date)// Date로 변환

        dateformatter.dateFormat = "HH:mm aa"
        let dateString = dateformatter.string(from: date!) // Date String으로 변환

        return dateString
    }
    
}
