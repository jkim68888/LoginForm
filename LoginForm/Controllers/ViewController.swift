//
//  ViewController.swift
//  LoginForm
//
//  Created by 김지현 on 2022/10/02.
//

import UIKit

final class ViewController: UIViewController {
// final keyword : 클래스 상속을 불가능하게 해서 다이렉트 디스패치가 일어나도록 함
	
	private let loginView = LoginView()
	
	// viewdidload 보다 먼저 호출됨, 기본뷰를 교체해줄 수 있다.
	override func loadView() {
		view = loginView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupAddTarget()
	}

	func setupAddTarget() {
		loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
		loginView.passwordSecureButton.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
	}
	
	@objc func passwordSecureModeSetting() {
		loginView.passwordTextField.isSecureTextEntry.toggle()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	@objc func loginButtonTapped() {
		let alert = UIAlertController(title: "로그인 되었습니다:)", message: nil, preferredStyle: .alert)
		
		let success = UIAlertAction(title: "확인", style: .default)
		
		alert.addAction(success)
		
		present(alert, animated: true)
	}
}
