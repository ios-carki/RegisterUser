//
//  LoginViewController.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import UIKit

final class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    let modelView = APIServiceModel()
    
    override func loadView() {
        view = mainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviSetting()
        displayUserData()
    }
    
    func displayUserData() {
        print("프로파일 메서드 실행")
        modelView.profile()
        
    }
    
    func naviSetting() {
        
        let logoutButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(logoutButtonCliked))
        
        self.title = "프로필 뷰 입니다."
        navigationItem.rightBarButtonItem = logoutButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        
    }
    
    @objc func logoutButtonCliked() {
        logoutAlert()
    }
    
    func logoutAlert() {
        let alert = UIAlertController(title: "로그아웃", message: "정말로 로그아웃 하시겠습니까?", preferredStyle: .alert)
        let logout = UIAlertAction(title: "로그아웃", style: .default) { action in
            
                
            UserDefaults.standard.set(false, forKey: "oldUser")
            self.dismiss(animated: true, completion: nil)
                
                
             let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
             let sceneDelegate = windowScene?.delegate as? SceneDelegate
             let vc = RegisterUserVIewController()
             let nav = UINavigationController(rootViewController: vc)
             
             sceneDelegate?.window?.rootViewController = nav
             sceneDelegate?.window?.makeKeyAndVisible()
                 
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        [logout, cancel].forEach {
            alert.addAction($0)
        }
        
        self.present(alert, animated: true)
        
        
    }
    
}
