//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 3/30/24.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String? = ""
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "characterIcon")
        return imageView
    }()
    
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-SemiBold", size: 25)
        return label
    }()
    
    private var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(hexCode: "#FF6F0F")
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    private lazy var reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(hexCode: "DDDEE3")
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(hexCode: "ACB0B9"), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(reloginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func reloginButtonDidTapped() {
        //Modal
        if self.navigationController == nil {
            self.dismiss(animated: true)
        }
        //Navigation
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, mainButton, reloginButton].forEach {
            self.view.addSubview($0)
        }
    }
}
