//
//  String+.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 16/7/2022.
//

import Foundation

extension String {
    static let empty = String()
    
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
}

