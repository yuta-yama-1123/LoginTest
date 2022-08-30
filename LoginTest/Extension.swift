//
//  Extension.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/30.
//

import Foundation

extension String {
    func removingWhiteSpace() -> String {
        let whiteSpaces: CharacterSet = [" ", "　"]
        return self.trimmingCharacters(in: whiteSpaces)
    }
}
