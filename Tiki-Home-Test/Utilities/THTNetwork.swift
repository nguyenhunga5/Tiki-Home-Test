//
//  THTNetwork.swift
//  Tiki-Home-Test
//
//  Created by Hung Nguyen Thanh on 3/22/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import UIKit
import Alamofire

enum EndPoint: String {
    case mostKeywords = "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json"
}

class THTNetwork: NSObject {
    
    static let sharred = THTNetwork()
    
    func getMostKeywords(complete: @escaping (_ keywords: THTKeywords?) -> Void) {
        let request = Alamofire.request(EndPoint.mostKeywords.rawValue,
                                        method: .get, parameters: nil,
                                        encoding: URLEncoding.default, headers: nil)
        request.responseData {[weak self] response in
            guard let `self` = self, let data = response.data else {
                complete(nil)
                return
            }
            do {
                let keywords: THTKeywords = try self.THTJSONDecoder().decode(THTKeywords.self, from: data)
                complete(keywords)
            } catch {
                complete(nil)
            }
        }
    }
    
    fileprivate func THTJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
}
