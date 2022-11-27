//
//  ContentView.swift
//  DismissMultiNav-SwiftUI
//
//  Created by Kim Insub on 2022/11/27.
//

import SwiftUI

class NavigationModel: ObservableObject {
    @Published var firstIsActive = false
    @Published var secondIsActive = false
    @Published var thirdIsActive = false

    func returnToView2() {
        firstIsActive = false
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Root()
        }
        .environmentObject(NavigationModel())
    }
}

struct Root: View {
    @EnvironmentObject var navModel: NavigationModel

    var body: some View {
        NavigationLink("Go to First", destination: First(), isActive: $navModel.firstIsActive)
            .isDetailLink(false)
            .navigationTitle("Root")
    }
}

struct First: View {

    @EnvironmentObject var navModel: NavigationModel

    var body: some View {
        NavigationLink("Go to Second", destination: Second(), isActive: $navModel.secondIsActive)
            .isDetailLink(false)
            .navigationTitle("First")
    }
}

struct Second: View {

    @EnvironmentObject var navModel: NavigationModel

    var body: some View {
        NavigationLink("Go to Third", destination: Third(), isActive: $navModel.thirdIsActive)
            .isDetailLink(false)
            .navigationTitle("Second")
    }
}

struct Third: View {

    @EnvironmentObject var navModel: NavigationModel

    var body: some View {
        Button("Go back to Root", action: navModel.returnToView2)
            .navigationTitle("Third")
    }
}
