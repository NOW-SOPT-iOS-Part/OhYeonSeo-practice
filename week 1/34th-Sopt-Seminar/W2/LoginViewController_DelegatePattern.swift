//
//  LoginViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController_DelegatePattern: UIViewController{
    
    let pretendardSB = NSMutableAttributedString(string: "Pretendard-SemiBold")

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.backgroundColor = UIColor(hexCode: "DDDEE3")
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexCode: "ACB0B9")]
        )
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.backgroundColor = UIColor(hexCode: "DDDEE3")
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 52))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexCode: "ACB0B9")]
        )
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 52))
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hexCode: "#FF6F0F")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
            self.view.translatesAutoresizingMaskIntoConstraints = false
        }
        titleLabel.snp.makeConstraints {
            //$0 = closure 안에 있는 인자값
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(161)
        }

        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(20)
            //$0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(58)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
    }
    
    @objc func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    //using Navigation
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.delegate = self //self = loginVC
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

extension LoginViewController_DelegatePattern: DataBindProtocol {
    func dataBind(id: String?) {
        idTextField.text = "\(id ?? "")에서 어떤걸로 할꺼얌?"
    }
}

