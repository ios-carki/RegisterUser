//
//  LoginView.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import UIKit

import SnapKit

class LoginView: BaseView {
    
    let backGroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "mainImage")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 100
        view.clipsToBounds = true
        return view
    }()
    
    let nickNameLableBar: UILabel = {
        let view = UILabel()
        view.text = "닉네임"
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    let nickNameLable: UILabel = {
        let view = UILabel()
        view.text = "닉네임"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let idLableBar: UILabel = {
        let view = UILabel()
        view.text = "아이디"
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    let idLable: UILabel = {
        let view = UILabel()
        view.text = "아이디(이메일 형식"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func configureUI() {
        [backGroundImage, profileImage, nickNameLableBar, nickNameLable, idLableBar, idLable].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        backGroundImage.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(10)
            make.height.equalTo(100)
        }
        
        profileImage.snp.makeConstraints { make in
            make.bottom.equalTo(nickNameLableBar.snp.top).offset(-40)
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        nickNameLableBar.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.equalTo(100)
        }
        
        nickNameLable.snp.makeConstraints { make in
            make.top.equalTo(nickNameLableBar.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(30)
        }
        
        idLableBar.snp.makeConstraints { make in
            make.top.equalTo(nickNameLable.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.equalTo(100)
        }
        
        idLable.snp.makeConstraints { make in
            make.top.equalTo(idLableBar.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(nickNameLable.snp.height)
        }
    }
    
}
