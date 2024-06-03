//
//  ChattingViewController.swift
//  Chatting
//
//  Created by 여성은 on 6/3/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    
    var chatroom: ChatRoom?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = chatroom?.chatroomName
        configureView()
        configureTableView()
    }

    
}

extension ChattingViewController {
    func configureView() {
        let item = UIBarButtonItem(image:UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.leftBarButtonItem = item
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let userXib = UINib(nibName: UserTableViewCell.identifier, bundle: nil)
        chatTableView.register(userXib, forCellReuseIdentifier: UserTableViewCell.identifier)
        
        let otherXib = UINib(nibName: OtherPersonTableViewCell.identifier, bundle: nil)
        chatTableView.register(otherXib, forCellReuseIdentifier: OtherPersonTableViewCell.identifier)
        
        let index = IndexPath(row: (chatroom?.chatList.count ?? 0) - 1, section: 0)
        chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroom?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = chatroom?.chatList[indexPath.row] else { return UITableViewCell()}
        if data.user != .user { // otherPerson
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
            cell.configureData(chat: data)
            
            return cell
        } else { // user
            let cell = tableView.dequeueReusableCell(withIdentifier: OtherPersonTableViewCell.identifier, for: indexPath) as! OtherPersonTableViewCell
            cell.configureData(chat: data)
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
