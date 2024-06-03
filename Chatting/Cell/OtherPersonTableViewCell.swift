//
//  OtherPersonTableViewCell.swift
//  Chatting
//
//  Created by 여성은 on 6/4/24.
//

import UIKit

class OtherPersonTableViewCell: UITableViewCell {
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    func configureLayout() {
        messageLabel.font = .systemFont(ofSize: 13, weight: .medium)
        messageLabel.numberOfLines = 0
        messageLabel.clipsToBounds = true
        messageLabel.backgroundColor = .lightGray.withAlphaComponent(0.5)
        messageLabel.layer.cornerRadius = 5
        messageLabel.layer.borderWidth = 1
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .gray
    }
    
    func configureData(chat: Chat) {
        messageLabel.text = chat.message
        dateLabel.text = .formatDateChat(date: chat.date)
    }
    
}
