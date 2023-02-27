//
//  ListJsonApp.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/23.
//

import SwiftUI

@main
struct ListJsonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AnnotatedItems(name: "", address: "" , latitude: "" , longitude: ""))
        }
    }
}
