import UIKit

var greeting = "Hello, playground"

var darkModeIsActive: Bool = false

func toggleDarkMode() {
    darkModeIsActive.toggle()
    print("|||||| TOGGLE: Dark Mode updated to \(darkModeIsActive)")
}

toggleDarkMode()
toggleDarkMode()
toggleDarkMode()
