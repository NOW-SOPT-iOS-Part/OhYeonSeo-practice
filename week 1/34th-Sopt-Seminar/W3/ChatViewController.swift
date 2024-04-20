//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController { // -- 1번
    
    private let tableView = UITableView(frame: .zero, style: .plain) // -- 2번
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
//        setDelegate()
//        register()
    }
    
    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
