//
//  Collection+.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 27/7/2022.
//

import Foundation

extension Collection where Element == Int {
    var digitoCPF: Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}
