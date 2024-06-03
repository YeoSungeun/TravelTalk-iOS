//
//  UserTableViewCell.swift
//  Chatting
//
//  Created by 여성은 on 6/4/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
        
    }
    override func layoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    func configureLayout() {
        profileImageView.contentMode = .scaleAspectFill
        
        userLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        userLabel.textColor = .darkGray
        
        messageLabel.font = .systemFont(ofSize: 13, weight: .medium)
        messageLabel.numberOfLines = 0
        messageLabel.clipsToBounds = true
        messageLabel.backgroundColor = .white
        messageLabel.layer.cornerRadius = 5
        messageLabel.layer.borderWidth = 1
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .gray
    }
    
    func configureData(chat: Chat) {
        profileImageView.image = UIImage(named: chat.user.profileImage)
        userLabel.text = chat.user.rawValue
        messageLabel.text = chat.message
        dateLabel.text = .formatDateChat(date: chat.date)
    }
    
}
