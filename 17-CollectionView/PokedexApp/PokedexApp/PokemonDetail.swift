//
//  PokemonDetail.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/30/22.
//

import UIKit

class PokemonDetail: UIViewController {
    
    @IBOutlet weak var iconBar: UIStackView!
    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var icon2: UIImageView!

    @IBOutlet weak var pokemon: UIImageView!

    @IBOutlet weak var predecessor: UIImageView!
    @IBOutlet weak var successor: UIImageView!
    
    @IBOutlet weak var devolveButton: UIButton!
    @IBOutlet weak var evolveButton: UIButton!
    
    @IBOutlet weak var cycleUp: UIButton!
    
    @IBOutlet weak var bottomBg: UIView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var vm: PokemonViewModel?
    var evolvableDelegate: Evolvable?
    
    var predecessorVM: PokemonViewModel?
    var successorVMs: [PokemonViewModel]?
    var successorID = 0
    
    var disableBack = false
    var disableForward = false
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "PokemonDetail", bundle: nil)
    var evolvableVC: PokemonDetail? {
        storyBoard.instantiateViewController(withIdentifier: "PokemonDetail") as? PokemonDetail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        guard let vm = vm else { return }
        prepareToEvolve()
        
        title = vm.name
        
        icon1.image = UIImage(named: vm.type1)
        if vm.type2 != nil { icon2.image = UIImage(named: vm.type2!) }
        else {
            icon2.removeFromSuperview()
        }
        
        self.pokemon.image = vm.image
        predecessor.image = predecessorVM?.image
        if !(successorVMs?.isEmpty ?? true) {
            successor.image = successorVMs![successorID].image
        }
        self.descriptionLabel.text = vm.description
        self.abilitiesLabel.text = vm.abilities
        
        removeDisabled()
        configureGradient()
    }
    
    func prepareToEvolve() {
        guard let vm = vm else { return }
        if let succesors = vm.successors {
            successorVMs = evolvableDelegate?.evolve(to: succesors)
        }
        
        guard let predecessor = vm.predecessor else { return }
        predecessorVM = evolvableDelegate?.devolve(to: predecessor)
    }
    
    func removeDisabled() {
        if predecessorVM == nil || disableBack {
            predecessor.removeFromSuperview()
            devolveButton.removeFromSuperview()
        }
        if successorVMs?.count ?? 0 <= 1 || disableForward {
            cycleUp.removeFromSuperview()
            
            if successorVMs?.count ?? 0 < 1 || disableForward {
                successor.removeFromSuperview()
                evolveButton.removeFromSuperview()
            }
        }
        
    }

    func configureGradient() {
        guard let vm = vm else { return }

        let gradient = CAGradientLayer()
        gradient.colors = vm.getGradientColors()
        
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        gradient.frame = bottomBg.bounds
        bottomBg.layer.addSublayer(gradient)
        bottomBg.layer.zPosition = 0
    }
    
    @IBAction func onClickCycle(_ sender: UIButton) {
        if successorID + 1 < successorVMs?.count ?? successorID {
            successorID += 1
        } else {
            successorID = 0
        }
        successor.image = successorVMs?[successorID].image
    }
    
    @IBAction func onClickEvolve(_ sender: UIButton) {
        guard let evolvableVC = evolvableVC else { return }
        if sender.tag == 0 {
            guard let predecessorVM = predecessorVM else { return }
            evolvableVC.vm = predecessorVM
            evolvableVC.disableForward = true
        } else {
            guard let successorVM = successorVMs?[successorID] else { return }
            evolvableVC.vm = successorVM
            evolvableVC.disableBack = true
        }
        evolvableVC.evolvableDelegate = evolvableDelegate
        navigationController?.show(evolvableVC, sender: nil)
    }
    
    
    
}
