//
//  Extensions.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in:.whitespacesAndNewlines).isEmpty
    }
}
