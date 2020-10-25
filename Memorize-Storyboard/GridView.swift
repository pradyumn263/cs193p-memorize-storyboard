//
//  GridView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 24/10/20.
//

import SwiftUI

struct GridView<Item, ItemView>: View where Item: Identifiable, Item: Equatable, ItemView: View {
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            let layout = GridLayout(itemCount: items.count, in: geometry.size)
            
            ForEach(items) { item in
                if let index = items.firstIndex(of: item) {
                    viewForItem(item)
                        .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                        .position(layout.location(ofItemAt: index))
                }
            }
        }
    }
    
}


