//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Seth Skocelas on 8/29/25.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
