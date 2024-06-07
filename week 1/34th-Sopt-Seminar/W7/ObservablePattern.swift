//
//  ObservablePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 6/7/24.
//

import Foundation

 class ObservablePattern<T> {

     var value: T? {
         didSet {
             self.listener?(value)
         }
     }

     init(_ value: T?) {
         self.value = value
     }

     private var listener: ((T?) -> Void)?

     func bind(_ listener: @escaping (T?) -> Void) {
         listener(value)
         self.listener = listener
     }
 }
