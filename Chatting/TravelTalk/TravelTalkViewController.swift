//
//  TravelTalkViewController.swift
//  Chatting
//
//  Created by 여성은 on 6/2/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var traveltalkTableView: UITableView!
    
    var chatList = mockChatList
    var list: [ChatRoom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TRAVEL TALK"
        
        list = chatList
        
        configureTableView()
        configureSearchBar()

    }

}

extension TravelTalkViewController {
    func configureTableView() {
        traveltalkTableView.delegate = self
        traveltalkTableView.dataSource = self
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        traveltalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        
        traveltalkTableView.rowHeight = 80
    }
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "친구 이름을 검색해보세요"

    }
}

extension TravelTalkViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        list.removeAll()
        
        guard let text = searchBar.text, !text.isEmpty else {
            list = chatList
            traveltalkTableView.reloadData()
            return
        }
        for chatRoom in chatList {
            if chatRoom.chatroomName.contains(text) {
                list.append(chatRoom)
            }
        }
        traveltalkTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        list.removeAll()
        
        guard let text = searchBar.text, !text.isEmpty else {
            list = chatList
            traveltalkTableView.reloadData()
            view.endEditing(true)
            return
        }
        for chatRoom in chatList {
            if chatRoom.chatroomName.contains(text) {
                list.append(chatRoom)
            }
        }
        traveltalkTableView.reloadData()
        
        view.endEditing(true)
    }

}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        cell.configureCell(data: list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let data = list[indexPath.row]
        
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        
        vc.chatroom = data
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
