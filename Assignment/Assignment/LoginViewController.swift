//
//  LoginViewController.swift
//  Assignment
//
//  Created by Madhuri Latha Valluri on 20/09/21.
//

import UIKit
import RxSwift

let kMainView = "showMainView"

class LoginViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var userErrorLabel: UILabel!
  @IBOutlet weak var passwordErrorLabel: UILabel!
  @IBOutlet weak var loginButton: UIButton!
  let disposeBag = DisposeBag()
  let viewModel = LoginViewModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loginButton.setTitleColor(.gray, for: .disabled)
    //userErrorLabel.isHidden = true
    //passwordErrorLabel.isHidden = true
    setupBindings()
  }
  
  func setupBindings(){
    usernameTextField.rx.text.bind(to: viewModel.usernameSubject).disposed(by: disposeBag)
    passwordTextField.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
    
    viewModel.isValidUsername.bind(to: userErrorLabel.rx.isHidden).disposed(by: disposeBag)
    viewModel.isValidPassword.bind(to: passwordErrorLabel.rx.isHidden).disposed(by: disposeBag)
    viewModel.isValidDataForm.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
  }
  
  @IBAction func loginAction(_ sender: UIButton){
    self.performSegue(withIdentifier: kMainView, sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == kMainView{
      let mainVC = segue.destination as! MainViewController
      mainVC.userName = usernameTextField.text!
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }

}

