//
//  ChattingViewController.swift
//  Chatting
//
//  Created by 여성은 on 6/3/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    var chatroom: ChatRoom?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = chatroom?.chatroomName


    }
    



}
