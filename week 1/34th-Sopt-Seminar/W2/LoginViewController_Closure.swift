//
//  LoginViewController_Closure.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/6/24.
//

import Foundation
import UIKit

class LoginViewController_Closure: UIViewController{
    
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
        }
    }
    
    @objc func loginButtonDidTap() {
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    //using Modal
    private func presentToWelcomeVC(){
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.modalTransitionStyle = .coverVertical
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    //using Navigation
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
