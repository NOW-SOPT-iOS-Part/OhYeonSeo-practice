//
//  ScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

class ScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    private lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [redView,orangeView,yellowView,greenView, blueView,purpleView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low)
            // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
                
        redView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView)
            make.trailing.equalTo(self.view.snp.centerX)
            make.height.equalTo(330)
        }
        
        orangeView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(redView.snp.trailing)
            make.width.equalToSuperview()
            make.height.equalTo(330)
        }
        
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalTo(self.view.snp.centerX)
            make.height.equalTo(330)
        }
        
        greenView.snp.makeConstraints { make in
            make.top.equalTo(orangeView.snp.bottom)
            make.leading.equalTo(yellowView.snp.trailing)
            make.width.equalToSuperview()
            make.height.equalTo(330)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalTo(self.view.snp.centerX)
            make.height.equalTo(330)
            make.bottom.equalTo(contentView)
        }
        
        purpleView.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.bottom)
            make.leading.equalTo(blueView.snp.trailing)
            make.width.equalToSuperview()
            make.height.equalTo(330)
            make.bottom.equalTo(contentView)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
}

#Preview{
    ScrollViewController()
}
