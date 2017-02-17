//
//  ProfileViewController.swift
//  Pokedex
//
//  Created by Shireen Warrier on 2/15/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIWebViewDelegate {
    var pokemon: Pokemon!
    var pokeImage: UIImageView!
    var nameLabel: UILabel!
    var typeLabel: UILabel!
    var numLabel: UILabel!
    var speciesLabel: UILabel!
    var HPLabel: UILabel!
    var AttackLabel: UILabel!
    var DefenseLabel: UILabel!
    var SpAttackLabel: UILabel!
    var SpDefenseLabel: UILabel!
    var SpeedLabel: UILabel!
    var BSTTotalLabel: UILabel!
    var webViewButton: UIButton!
    var favoritesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        pokeImage = UIImageView(frame: CGRect(x: view.frame.width/10 , y: view.frame.width/5, width: view.frame.width * (4/5), height: view.frame.width * (4/5)))
        if let url = NSURL(string: pokemon.imageUrl) {
            if let data = NSData(contentsOf: url as URL) {
                if pokemon.name.range(of: "Mega ") == nil {
                    pokeImage.contentMode = .scaleAspectFit
                    pokeImage.image = UIImage(data: data as Data)
                } else {
                    pokeImage.contentMode = .scaleAspectFit
                    pokeImage.image = #imageLiteral(resourceName: "missing_pokemon")
                }
            } else {
                pokeImage.contentMode = .scaleAspectFit
                pokeImage.image = #imageLiteral(resourceName: "missing_pokemon")
            }
        } else {
            pokeImage.contentMode = .scaleAspectFit
            pokeImage.image = #imageLiteral(resourceName: "missing_pokemon")
        }
        
        typeLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: pokeImage.frame.maxY, width: view.frame.width * (3/5), height: 20))
        var types = "Type: " + pokemon.types[0]
        if pokemon.types.count > 1 {
            types += "/"
            types += pokemon.types[1]
        }
        typeLabel.text = types
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.textColor = UIColor.black
        typeLabel.adjustsFontSizeToFitWidth = true
        
        numLabel = UILabel(frame: CGRect(x: typeLabel.frame.maxX + 5 , y: pokeImage.frame.maxY, width: view.frame.width / 5, height: 20))
        numLabel.text = "ID: " + String(pokemon.number)
        numLabel.adjustsFontForContentSizeCategory = true
        numLabel.textColor = UIColor.black
        numLabel.adjustsFontSizeToFitWidth = true
        
        nameLabel = UILabel(frame: CGRect(x: view.frame.width / 10, y: typeLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        nameLabel.text = pokemon.name
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.textColor = UIColor.black
        nameLabel.adjustsFontSizeToFitWidth = true
        
        speciesLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: nameLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        speciesLabel.text = "Species: " + pokemon.species
        if pokemon.species == "" {
            speciesLabel.text = "Species: N/A"
        }
        speciesLabel.adjustsFontForContentSizeCategory = true
        speciesLabel.textColor = UIColor.black
        speciesLabel.adjustsFontSizeToFitWidth = true
        
        HPLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: speciesLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        HPLabel.text = "HP: " + String(pokemon.health)
        HPLabel.adjustsFontForContentSizeCategory = true
        HPLabel.textColor = UIColor.black
        HPLabel.adjustsFontSizeToFitWidth = true
        
        AttackLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: HPLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        AttackLabel.text = "Attack: " + String(pokemon.attack)
        AttackLabel.adjustsFontForContentSizeCategory = true
        AttackLabel.textColor = UIColor.black
        AttackLabel.adjustsFontSizeToFitWidth = true
        
        DefenseLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: AttackLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        DefenseLabel.text = "Defense: " + String(pokemon.defense)
        DefenseLabel.adjustsFontForContentSizeCategory = true
        DefenseLabel.textColor = UIColor.black
        DefenseLabel.adjustsFontSizeToFitWidth = true
        
        SpAttackLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: DefenseLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        SpAttackLabel.text = "Special Attack: " + String(pokemon.specialAttack)
        SpAttackLabel.adjustsFontForContentSizeCategory = true
        SpAttackLabel.textColor = UIColor.black
        SpAttackLabel.adjustsFontSizeToFitWidth = true
        
        SpDefenseLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: SpAttackLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        SpDefenseLabel.text = "Special Defense: " + String(pokemon.specialDefense)
        SpDefenseLabel.adjustsFontForContentSizeCategory = true
        SpDefenseLabel.textColor = UIColor.black
        SpDefenseLabel.adjustsFontSizeToFitWidth = true
        
        SpeedLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: SpDefenseLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        SpeedLabel.text = "Speed: " + String(pokemon.speed)
        SpeedLabel.adjustsFontForContentSizeCategory = true
        SpeedLabel.textColor = UIColor.black
        SpeedLabel.adjustsFontSizeToFitWidth = true
        
        BSTTotalLabel = UILabel(frame: CGRect(x: view.frame.width/10 , y: SpeedLabel.frame.maxY, width: view.frame.width * (4/5), height: 20))
        BSTTotalLabel.text = "Total: " + String(pokemon.total)
        BSTTotalLabel.adjustsFontForContentSizeCategory = true
        BSTTotalLabel.textColor = UIColor.black
        BSTTotalLabel.adjustsFontSizeToFitWidth = true
        
        webViewButton = UIButton(frame: CGRect(x: 0, y: BSTTotalLabel.frame.maxY, width: 150, height: 100))
        webViewButton.setTitle("Search on the Web", for: .normal)
        webViewButton.setTitleColor(UIColor.black, for: .normal)
        webViewButton.addTarget(self, action:#selector(setupWebView), for: .touchUpInside)
        
        favoritesButton = UIButton(frame: CGRect(x: 200, y: BSTTotalLabel.frame.maxY, width: 150, height: 100))
        favoritesButton.setTitle("Add to Favorites", for: .normal)
        favoritesButton.setTitleColor(UIColor.black, for: .normal)
        favoritesButton.addTarget(self, action:#selector(addToFavorites), for: .touchUpInside)
        
        view.addSubview(pokeImage)
        view.addSubview(typeLabel)
        view.addSubview(numLabel)
        view.addSubview(nameLabel)
        view.addSubview(speciesLabel)
        view.addSubview(HPLabel)
        view.addSubview(AttackLabel)
        view.addSubview(DefenseLabel)
        view.addSubview(SpAttackLabel)
        view.addSubview(SpDefenseLabel)
        view.addSubview(SpeedLabel)
        view.addSubview(BSTTotalLabel)
        view.addSubview(webViewButton)
        view.addSubview(favoritesButton)
    }
    
    func setupWebView() {
        let webView: UIWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        webView.delegate = self
        self.view.addSubview(webView)
        
        let pokemonName: String = pokemon.name.replacingOccurrences(of: " ", with: "+")
        
        let url = URL(string: "https://google.com/search?q=" + pokemonName)
        let urlRequest: URLRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
    }
    
    func addToFavorites() {
        print("hi")
        storeValue(pokemon: pokemon)
    }
    
    func storeValue(pokemon: Pokemon) {
        let defaults = UserDefaults.standard
        
        let favorite = defaults.object(forKey: TabBarViewController.defaultsKeys.favoritesArray)

        defaults.setValue(favorite, forKey: TabBarViewController.defaultsKeys.favoritesArray)

        
        defaults.synchronize()
    }
    
    
}
