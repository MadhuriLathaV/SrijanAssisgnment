//
//  MainViewController.swift
//  Assignment
//
//  Created by Madhuri Latha Valluri on 20/09/21.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var welcomeLabel: UILabel!
  var userName: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    welcomeLabel.text = "Hello " + userName
  }
}
