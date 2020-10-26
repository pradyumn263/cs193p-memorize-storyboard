//
//  Array+OnlyItem.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 24/10/20.
//

import Foundation

extension Array {
    func onlyItem () -> Element? {
        count == 1 ? first : nil
    }
}
