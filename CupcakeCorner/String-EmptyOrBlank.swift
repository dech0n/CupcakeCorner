//
//  String-EmptyOrBlank.swift
//  CupcakeCorner
//
//  Created by Dechon Ryan on 5/28/24.
//

import Foundation

extension String {
    var isEmptyOrBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
