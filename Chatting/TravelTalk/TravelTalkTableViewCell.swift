//
//  TravelTalkTableViewCell.swift
//  Chatting
//
//  Created by 여성은 on 6/2/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var UserLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
    }
    
    func configureLayout() {
        
        profileImageView.contentMode = .scaleAspectFill
        
        UserLabel.font = .systemFont(ofSize: 14, weight: .bold)
        messageLabel.font = .systemFont(ofSize: 13, weight: .medium)
        messageLabel.textColor = .darkGray
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .gray
        
    }

    func configureCell(data: ChatRoom) {
        if data.chatroomImage.count > 1 {
            profileImageView.image = UIImage(systemName: "star")
        } else {
            profileImageView.image = UIImage(named: data.chatroomImage[0])
        }
        UserLabel.text = data.chatroomName
        messageLabel.text = data.chatList[0].message
        dateLabel.text = .formatDateTravelTalk(data.chatList[0].date)
    }
    
}
