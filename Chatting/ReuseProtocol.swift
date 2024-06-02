//
//  ReuseProtocol.swift
//  Chatting
//
//  Created by 여성은 on 6/3/24.
//

import UIKit

protocol ReuseProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReuseProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
