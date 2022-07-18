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
        NetworkService.shared.fetchJoke() { joke in
            if let jokeText = joke?.value {
                DispatchQueue.main.async {
                    self.firstLabel.text = jokeText
                }
            }
        }
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        NetworkService.shared.fetchDrink() { drinkList in
            if let drinkName = drinkList?.drinks?.first?.strDrink {
                DispatchQueue.main.async {
                    self.firstLabel.text = drinkName
                }
            }
        }
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        NetworkService.shared.fetchEpisode() { episode in
            if let episodeName = episode?.name {
                DispatchQueue.main.async {
                    self.firstLabel.text = episodeName
                }
            }
        }

    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        NetworkService.shared.fetchMusic() { data in
            if let artistName = data?.feed?.results?.first?.artistName {
                DispatchQueue.main.async {
                    self.firstLabel.text = artistName
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
