//
//  ThemeView.swift
//  Memorize-Storyboard
//
//  Created by Pradyumn Shukla on 09/11/20.
//

import SwiftUI

struct ThemeView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ThemeButtonView(label: "Food", currentColor: viewModel.getColor)
                    .onTapGesture {
                        viewModel.setTheme(newTheme: .food)
                        presentationMode.wrappedValue.dismiss()
                    }
                ThemeButtonView(label: "Flags", currentColor: viewModel.getColor)
                    .onTapGesture {
                        viewModel.setTheme(newTheme: .flags)
                        presentationMode.wrappedValue.dismiss()
                    }
                ThemeButtonView(label: "Emojis", currentColor: viewModel.getColor)
                    .onTapGesture {
                        viewModel.setTheme(newTheme: .emojis)
                        presentationMode.wrappedValue.dismiss()
                    }
                ThemeButtonView(label: "People", currentColor: viewModel.getColor)
                    .onTapGesture {
                        viewModel.setTheme(newTheme: .people)
                        presentationMode.wrappedValue.dismiss()
                    }
                ThemeButtonView(label: "Animals", currentColor: viewModel.getColor)
                    .onTapGesture {
                        viewModel.setTheme(newTheme: .animals)
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .navigationBarTitle(Text("Theme"), displayMode: .large)
            .navigationBarItems(trailing: Button (action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image.init(systemName: "xmark")
            }))
        }
        .foregroundColor(.accentColor)
    }
}

