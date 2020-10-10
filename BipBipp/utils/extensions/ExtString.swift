//
//  ExtString.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation

extension String{
    var encodeToData : Data? {
        return self.data(using: String.Encoding.utf8)
    }
}