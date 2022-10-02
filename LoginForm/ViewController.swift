//
//  ViewController.swift
//  LoginForm
//
//  Created by 김지현 on 2022/10/02.
//

import UIKit

class ViewController: UIViewController {
	
	private lazy var emailTextFieldView: UIView = {
		let view = UIView()
		view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
		view.layer.cornerRadius = 5
		view.layer.masksToBounds = true
		// 순서 중요
		view.addSubview(emailTextField)
		view.addSubview(emailInfoLabel)
		return view
	}()
	
	private var emailInfoLabel: UILabel = {
		let label = UILabel()
		label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		label.text = "이메일주소 또는 전화번호"
		label.font = .systemFont(ofSize: 18)
		return label
	}()
	
	private lazy var emailTextField: UITextField = {
		let tf = UITextField()
		tf.frame.size.height = 48
		tf.backgroundColor = .clear
		tf.textColor = .white
		tf.tintColor = .white
		tf.autocapitalizationType = .none
		tf.autocorrectionType = .no
		tf.spellCheckingType = .no
		tf.keyboardType = .emailAddress
		return tf
	}()
	
	private lazy var passwordTextFieldView: UIView = {
		let view = UIView()
		self.view.addSubview(view)
		view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
		view.layer.cornerRadius = 5
		view.layer.masksToBounds = true
		view.addSubview(passwordTextField)
		view.addSubview(passwordInfoLabel)
		view.addSubview(passwordSecureButton)
		return view
	}()
	
	private var passwordInfoLabel: UILabel = {
		let label = UILabel()
		label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		label.text = "비밀번호"
		label.font = .systemFont(ofSize: 18)
		return label
	}()
	
	private lazy var passwordTextField: UITextField = {
		let tf = UITextField()
		tf.frame.size.height = 48
		tf.backgroundColor = .clear
		tf.textColor = .white
		tf.tintColor = .white
		tf.autocapitalizationType = .none
		tf.autocorrectionType = .no
		tf.spellCheckingType = .no
		tf.isSecureTextEntry = true
		tf.clearsOnBeginEditing = false
		return tf
	}()
	
	private let passwordSecureButton: UIButton = {
		let button = UIButton(type: .custom)
		button.setTitle("표시", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
		return button
	}()
	
	private let loginButton: UIButton = {
		let button = UIButton(type: .custom)
		button.backgroundColor = .clear
		button.layer.cornerRadius = 5
		button.clipsToBounds = true
		button.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
		button.layer.borderWidth = 1
		button.setTitle("로그인", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 16)
		button.isEnabled = false
		return button
	}()
	
	private lazy var stackView: UIStackView = {
		let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
		st.spacing = 18
		st.axis = .vertical
		st.distribution = .fillEqually
		st.alignment = .fill
		return st
	}()
	
	private let passwordResetButton: UIButton = {
		let button = UIButton(type: .custom)
		button.backgroundColor = .clear
		button.setTitle("비밀번호 재설정", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 14)
		return button
	}()
	
	private let textViewHeight: CGFloat = 48
	private let textViewMargin: CGFloat = 18

	override func viewDidLoad() {
		super.viewDidLoad()
		setUI()
	}

	func setUI() {
		view.backgroundColor = .black
		
		view.addSubview(stackView)
		view.addSubview(passwordResetButton)

		stackView.translatesAutoresizingMaskIntoConstraints = false
		emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
		passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			stackView.heightAnchor.constraint(equalToConstant: textViewHeight * 3 + textViewMargin * 2),
			
			emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
			emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
			emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
			
			emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
			emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
			emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
			emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
			
			passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
			passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
			passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),

			passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
			passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
			passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
			passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
			
			passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
			passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
			passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
			
			passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
			passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
			passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
		])
	}
}

