//
//  SettingsView.swift
//  ToDo
//
//  Created by Kevin McKenney on 8/3/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var toDo: ToDo
    
    var body: some View {
        Toggle("Dark Mode", isOn: $toDo.darkMode).padding()
    }
}
