//
//  CustomOperators.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-18.
//

import Foundation
import SwiftUI

public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding (
        get : { lhs.wrappedValue ?? rhs },
        set : { lhs.wrappedValue = $0 }
    )
}
