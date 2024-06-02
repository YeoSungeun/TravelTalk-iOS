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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TRAVEL TALK"
        
        traveltalkTableView.delegate = self
        traveltalkTableView.dataSource = self
        searchBar.delegate = self
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        traveltalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        
        configureTableView()
        configureSearchBar()

    }
    

    
}

extension TravelTalkViewController {
    func configureTableView() {
        traveltalkTableView.rowHeight = 80
    }
    func configureSearchBar() {
        searchBar.placeholder = "친구 이름을 검색해보세요"
    }
}

extension TravelTalkViewController: UISearchBarDelegate {
    
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        cell.configureCell(data: chatList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let data = chatList[indexPath.row]
        
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        
        vc.chatroom = data
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
