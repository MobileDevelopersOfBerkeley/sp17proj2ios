//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit
import DropDown

class ViewController: UIViewController, UITextFieldDelegate {

    var searchBar: UISearchBar!
    var attackPointsLabel: UILabel!
    var attackPointsTextField: UITextField!
    var defensePointsLabel: UILabel!
    var defensePointsTextField: UITextField!
    var healthPointsLabel: UILabel!
    var healthPointsTextField: UITextField!
    
    let typeDropDown = DropDown()
    var typesButton: UIButton!
    var typeNames = ["Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"]
    
    var searchButton: UIButton!
    var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.attackPointsTextField.delegate = self //this allows keyboard dismissal when return button is clicked
        self.defensePointsTextField.delegate = self
        self.healthPointsTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpUI() {
        setUpScrollView()
        setUpSearchBar()
        setUpKeyboardDismiss()
        setUpPointsSearch()
        setUpTypeDropDown()
        setUpSearchButtons()
    }
    
    func setUpScrollView() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(scrollView)
        
    }
    
    func setUpSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: (navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: 40))
        view.addSubview(searchBar)
    }
    
    // Dismisses keyboard when another part of the screen is tapped
    func setUpKeyboardDismiss() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // Calls this function when the tap is recognized; gets rid of the keyboard.
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // When the user clicks return, this function dismisses keyboard
    func textFieldShouldReturn(_ userText: UITextField) -> Bool {
        view.endEditing(true)
        return true;
    }
    
    func setUpPointsSearch() {
        setUpAttackPoints()
        setUpDefensePoints()
        setUpHealthPoints()
    }
    
    func setUpAttackPoints() {
        //label setup
        attackPointsLabel = UILabel(frame: CGRect(x: view.frame.width / 5, y: searchBar.frame.maxY + (view.frame.height * 0.2), width: 30, height: 20))
        attackPointsLabel.text = "Minimum Attack Points: "
        attackPointsLabel.sizeToFit()
        view.addSubview(attackPointsLabel)
        // text field setup
        attackPointsTextField = UITextField(frame: CGRect(x: attackPointsLabel.frame.maxX + 10, y: attackPointsLabel.frame.minY, width: 40, height: attackPointsLabel.frame.height))
        attackPointsTextField.layer.borderWidth = 0.3
        attackPointsTextField.layer.cornerRadius = 3
        attackPointsTextField.textAlignment = .center
        view.addSubview(attackPointsTextField)
        
    }
    
    func setUpDefensePoints() {
        //label setup
        defensePointsLabel = UILabel(frame: CGRect(x: view.frame.width / 5.5, y: searchBar.frame.maxY + (view.frame.height * 0.4), width: 30, height: 20))
        defensePointsLabel.text = "Minimum Defense Points: "
        defensePointsLabel.sizeToFit()
        view.addSubview(defensePointsLabel)
        // text field setup
        defensePointsTextField = UITextField(frame: CGRect(x: defensePointsLabel.frame.maxX + 10, y: defensePointsLabel.frame.minY, width: 40, height: defensePointsLabel.frame.height))
        defensePointsTextField.layer.borderWidth = 0.3
        defensePointsTextField.layer.cornerRadius = 3
        defensePointsTextField.textAlignment = .center
        view.addSubview(defensePointsTextField)
    }

    func setUpHealthPoints() {
        //label setup
        healthPointsLabel = UILabel(frame: CGRect(x: view.frame.width / 5, y: searchBar.frame.maxY + (view.frame.height * 0.6), width: 30, height: 20))
        healthPointsLabel.text = "Minimum Health Points: "
        healthPointsLabel.sizeToFit()
        view.addSubview(healthPointsLabel)
        // text field setup
        healthPointsTextField = UITextField(frame: CGRect(x: healthPointsLabel.frame.maxX + 10, y: healthPointsLabel.frame.minY, width: 40, height: healthPointsLabel.frame.height))
        healthPointsTextField.layer.borderWidth = 0.3
        healthPointsTextField.layer.cornerRadius = 3
        healthPointsTextField.textAlignment = .center
        view.addSubview(healthPointsTextField)
    }
    
    func setUpTypeDropDown() {
        // Button setup
        typesButton = UIButton(frame: CGRect(x: view.frame.width / 3, y: healthPointsLabel.frame.maxY + 20, width: 50, height: 20))
        typesButton.setTitle("Choose Types", for: .normal)
        typesButton.sizeToFit()
        typesButton.setTitleColor(UIColor.black, for: .normal)
        typesButton.addTarget(self, action: #selector(typeButtonPressed), for: .touchUpInside)
        view.addSubview(typesButton)
    }
    
    func typeButtonPressed() {
        // create dropdown
        typeDropDown.anchorView = typesButton
        typeDropDown.dataSource = typeNames
        typeDropDown.direction = .bottom
        typeDropDown.show()
    }
    
    func setUpSearchButtons() {
        setUpRegularSearchButton()
        setUpRandomSearchButton()
    }
    
    func setUpRegularSearchButton() {
        searchButton = UIButton(frame: CGRect(x: view.frame.width / 4, y: searchBar.frame.maxY + (view.frame.height * 0.8), width: 50, height: 30))
        searchButton.setTitle("Search", for: .normal)
        searchButton.sizeToFit()
        searchButton.setTitleColor(UIColor.black, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        view.addSubview(searchButton)
    }
    
    func searchButtonPressed() {
        
    }
    
    func setUpRandomSearchButton() {
        randomButton = UIButton(frame: CGRect(x: view.frame.width / 1.75, y: searchBar.frame.maxY + (view.frame.height * 0.8), width: 50, height: 30))
        randomButton.setTitle("Random", for: .normal)
        randomButton.sizeToFit()
        randomButton.setTitleColor(UIColor.black, for: .normal)
        randomButton.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
        view.addSubview(randomButton)
    }
    
    func randomButtonPressed() {
        
    }
    
}

