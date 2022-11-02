//
//  RegisterUserVIewController.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import UIKit

final class RegisterUserVIewController: UIViewController {
    
    let mainView = RegisterUserView()
    let modelView = APIServiceModel()
    
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        naviSetting()
        submitButtonEvent()
        loginButtonEvent()
    }
    
    func naviSetting() {
        self.title = "회원가입"
    }
    
    func submitButtonEvent() {
        mainView.submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
    }
    
    @objc func submitButtonClicked() {
        guard let userID = mainView.nameTextField.text else { return }
        guard let userEmail = mainView.idTextField.text else { return }
        guard let userPW = mainView.passwordTextField.text else { return }
        let vc = LoginViewController()
        
        modelView.signup(name: userID, email: userEmail, password: userPW)
        print(userID)
        print(userEmail)
        print(userPW)
    }
    
    func loginButtonEvent() {
        mainView.signUpButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    @objc func loginButtonClicked() {
        modelView.login(userEmail: mainView.idTextField.text ?? "이메일 오류", userPassword: mainView.passwordTextField.text ?? "비밀번호 오류")
        
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        UserDefaults.standard.set(true, forKey: "oldUser")
        
        //navigationController?.pushViewController(vc, animated: true)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
        
    }
}
