//
//  ExtData.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation

extension Data{
    var toString : String {
        return String(decoding: self, as: UTF8.self)
    }
}
