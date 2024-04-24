//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController { // -- 1번
    
    //MARK: - Dummy
    
    private let chatList = ChatModel.dummy()
    
    //MARK: - UIView
    
    private let tableView = UITableView(frame: .zero, style: .plain) // -- 2번
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }
}

//MARK: - Extension

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
            cell.dataBind(chatList[indexPath.row])
            return cell
        }
}
