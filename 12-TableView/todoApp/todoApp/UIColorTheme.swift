//
//  UIColorTheme.swift
//  todoApp
//
//  Created by WillC on 8/4/22.
//

import Foundation
import UIKit

class Theme{
    var defaults : UserDefaults
    var currentTheme = "NOT_SET"
    
    init(){
        defaults = UserDefaults.standard
    }
    
    func saveTheme(newTheme:String) {
        defaults.set(newTheme, forKey: "THEME")
    }
    
    func getSavedColorTheme() -> String {
        currentTheme =  defaults.string(forKey: "THEME") ?? "ERROR"
        return currentTheme
    }
    
    func setColorTheme(themeString : String, view : UIView){
        currentTheme = themeString
        saveTheme(newTheme: themeString)
        updateTheme(view: view)
    }
    
    func updateTheme(view : UIView){
        if currentTheme == "LIGHT_THEME"{
            view.overrideUserInterfaceStyle = .light
        }
        if currentTheme == "DARK_THEME" {
            view.overrideUserInterfaceStyle = .dark
        }
    }
}
