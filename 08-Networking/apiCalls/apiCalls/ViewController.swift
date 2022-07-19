//
//  ViewController.swift
//  apiCalls
//
//  Created by Luat on 8/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
//    let networkService = NetworkService()
    
    /// Display the joke in firstLabel.text
    /// 1. Make API call using NetworkService class
    /// 2. Parse the JSON
    /// 3. Update firstLabel with the first item only
    @IBAction func jokesPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Joke button"
        NetworkService.shared.fetchJoke() {
            data in
            if let text = data.value {
                DispatchQueue.main.async {
                    self.firstLabel.text = text
                }
            }
        }
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Drinks button"
        NetworkService.shared.fetchDrink() {
            data in
            if let text = data?.drinks.first?.strDrink {
                DispatchQueue.main.async {
                    self.firstLabel.text = text
                }
            }
        }
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        
        firstLabel.text = "Testing TVShows button"
        NetworkService.shared.fetchEpisode() {
            data in
            if let text = data?.name {
                DispatchQueue.main.async {
                    self.firstLabel.text = text
                }
            }
        }
    }
    
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        firstLabel.text = "Testing music button"
        NetworkService.shared.fetchMusic() {
            data in
            if let text = data?.artistName {
                DispatchQueue.main.async {
                    self.firstLabel.text = text
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }

    func configureLabels() {
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityIdentifier = "FirstLabel"
        secondLabel.text = ""
    }
    
}
