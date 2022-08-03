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
    @IBOutlet weak var successors: UITableView!
    
    
    @IBOutlet weak var devolveButton: UIButton!
    
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
        self.descriptionLabel.text = vm.description
        self.abilitiesLabel.text = vm.abilities
        
        removeDisabled()
        configureGradient()
        configureSuccessors()
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
        if successorVMs?.count ?? 0 < 1 || disableForward {
            successors.removeFromSuperview()
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
    
    func configureSuccessors() {
        let nib = UINib(nibName: "SuccessorCell", bundle: nil)
        
        successors.register(nib, forCellReuseIdentifier: "SuccessorCell")
        successors.dataSource = self
        successors.delegate = self
    }
    
    @IBAction func onClickEvolve(_ sender: UIButton) {
        guard let evolvableVC = evolvableVC else { return }
        guard let predecessorVM = predecessorVM else { return }
        evolvableVC.vm = predecessorVM
        evolvableVC.disableForward = true
        evolvableVC.evolvableDelegate = evolvableDelegate
        navigationController?.show(evolvableVC, sender: nil)
    }
   
}

extension PokemonDetail: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        successorVMs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let successorVms = successorVMs else { return UITableViewCell() }

        guard let successor = successors.dequeueReusableCell(withIdentifier: "SuccessorCell", for: indexPath) as? SuccessorCell else { return UITableViewCell() }
        successor.pokemon.image = successorVms[indexPath.row].image
        return successor
    }
}

extension PokemonDetail: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "PokemonDetail", bundle: nil)
        
        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: "PokemonDetail") as? PokemonDetail else { return }
        guard let detailVM = successorVMs?[indexPath.row] else { return }
        
        detailVC.vm = detailVM
        detailVC.evolvableDelegate = evolvableDelegate
        navigationController?.show(detailVC, sender: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
}
