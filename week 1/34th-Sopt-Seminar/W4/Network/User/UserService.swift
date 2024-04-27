//
//  UserService.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/27/24.
//

import Foundation

import Moya

//(3-1)
final class UserService {
    static let shared = UserService()
    private var userProvider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension UserService {
    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        //(4-2). 응답 받기
        //응답이 왔는지 안 왔는지에 대한 분기처리
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                //응답이 왔으면 judgeStatus로 이동
                let networkResult = self.judgeStatus(by: statusCode, data, UserInfoResponseModel.self)
                completion(networkResult)
                
                //네트워크 연결 실패
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    //(3-1)
    func signUp(request: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: request)) { result in
            switch result {
            case .success(let response):
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")
                
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, SignUpResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    //(4-2). 응답 받기
    //statusCode로 "에러처리"(서버 통신 자체는 성공을 했어도, 우리가 원하는 데이터를 못 받았을 때)를 어떻게 할 지에 대한 분기처리
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    //(4-2). 응답 받기
    //통신이 성공하고 원하는 데이터가 올바르게 들어왔을 때 데이터를 처리하기 위한 메서드
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        //디코딩 성공
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            
            //디코딩 실패
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
}
