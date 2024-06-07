//
//  LoginView.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 5/25/24.
//

import UIKit
import SnapKit

import RxSwift
import RxCocoa

final class LoginView: UIView {
    
    let pretendardSB = NSMutableAttributedString(string: "Pretendard-SemiBold")
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let idTextField: UITextField = {
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
    
    let passwordTextField: UITextField = {
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
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 52))
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hexCode: "#FF6F0F")
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            addSubview($0)
        }
    }
}

