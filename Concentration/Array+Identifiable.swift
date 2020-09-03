//
//  Array+Identifiable.swift
//  Concentration
//
//  Created by Rashmi Sharma on 8/31/20.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? { // return type is an Optional
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil 
    }
}
