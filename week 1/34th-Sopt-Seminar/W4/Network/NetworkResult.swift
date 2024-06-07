//
//  NetworkResult.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/27/24.
//

//NetworkResult.swift - 네트워크 통신 중 예기치 못한 에러의 분기처리 파일

import Foundation

enum NetworkResult<T> {
    case success(T)               // 서버 통신 성공했을 때,
    case requestErr               // 요청 에러 발생했을 때,
    case decodedErr               // 디코딩 오류 발생했을 때
    case pathErr                  // 경로 에러 발생했을 때,
    case serverErr                // 서버의 내부적 에러가 발생했을 때,
    case networkFail              // 네트워크 연결 실패했을 때
}
