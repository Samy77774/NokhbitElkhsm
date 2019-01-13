//
//  API.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit
import Alamofire

class API {
    /// MAKE REQUEST
    class func Request(url: String, method: HTTPMethod,parameters: [String:Any]?, headers: [String:Any]?, completion: @escaping (_ succeeded: Bool, _ result: [String: AnyObject]) -> Void) {
        request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: (headers as? HTTPHeaders)).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(false, [:])
            case .success(let value):
                print(value)
                completion(true, value as! [String: AnyObject])
            }
        }
    }
    
    /// POST Image To Server
    class func POSTImage(url: String, Images: [Data]?, ImageParameters: [String]?, parameters:[String: Any], headers: [String:Any]?, completion: @escaping (_ succeeded: Bool, _ result: [String: AnyObject]) -> Void) {
        
        upload(multipartFormData: { (multipartFromData) in
            for (key, value) in parameters {
                multipartFromData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
            }
            if Images != nil && ImageParameters != nil {
                for (image, paramater) in zip(Images!, ImageParameters!) {
                    multipartFromData.append(image, withName: paramater, fileName: "Image.jpg", mimeType: "image/jpg")
                }
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url , method: .post, headers: headers as? HTTPHeaders) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                completion(false, [:])
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        print(value)
                        completion(true,  value as! [String : AnyObject])
                    case .failure(let error):
                        print(error)
                        completion(false, [:])
                    }
                })
            }
        }
    }
}
