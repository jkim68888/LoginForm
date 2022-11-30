//
//  LoginView.swift
//  LoginForm
//
//  Created by 김지현 on 2022/11/29.
//

import UIKit

class LoginView: UIView {
	
	private lazy var containerView: UIView = {
		let view = UIView()
		view.addSubview(emailView)
		view.addSubview(passwordView)
		view.addSubview(loginButton)
		return view
	}()
	
	private lazy var emailView: UIView = {
		let view = UIView()
		view.addSubview(emailTextFieldView)
		view.addSubview(emailValidationLabel)
		return view
	}()
	
	private lazy var emailTextFieldView: UIView = {
		// addSubview를 사용하려면 lazy var 로 선언해야함
		let view = UIView()
		view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
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
		tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
		return tf
	}()
	
	private var emailValidationLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14)
		return label
	}()
	
	private lazy var passwordView: UIView = {
		let view = UIView()
		view.addSubview(passwordTextFieldView)
		view.addSubview(passwordValidationLabel)
		return view
	}()
	
	private lazy var passwordTextFieldView: UIView = {
		let view = UIView()
		view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
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
	
	lazy var passwordTextField: UITextField = {
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
		tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
		return tf
	}()
	
	let passwordSecureButton: UIButton = {
		let button = UIButton(type: .custom)
		button.setTitle("표시", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
		return button
	}()
	
	private var passwordValidationLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14)
		return label
	}()
	
	let loginButton: UIButton = {
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
	
	private let textViewMargin: CGFloat = 18
	lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
	lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
	lazy var emailViewHeightConstraint = emailView.heightAnchor.constraint(equalToConstant: 48)
	lazy var passwordViewHeightConstraint = passwordView.heightAnchor.constraint(equalToConstant: 48)
	lazy var containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 48 * 3 + 18 * 2)

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
		addViews()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		backgroundColor = .black
		emailTextField.delegate = self
		passwordTextField.delegate = self
	}
	
	func addViews() {
		self.addSubview(containerView)
		self.addSubview(loginButton)
	}
	
	func setConstraints() {
		containerView.translatesAutoresizingMaskIntoConstraints = false
		emailView.translatesAutoresizingMaskIntoConstraints = false
		emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
		emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		emailValidationLabel.translatesAutoresizingMaskIntoConstraints = false
		passwordView.translatesAutoresizingMaskIntoConstraints = false
		passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
		passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
		passwordValidationLabel.translatesAutoresizingMaskIntoConstraints = false
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
			containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
			containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			containerViewHeightConstraint,
			
			emailView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			emailView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			emailView.topAnchor.constraint(equalTo: containerView.topAnchor),
			emailViewHeightConstraint,
			
			emailTextFieldView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
			emailTextFieldView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
			emailTextFieldView.topAnchor.constraint(equalTo: emailView.topAnchor),
			emailTextFieldView.heightAnchor.constraint(equalToConstant: 48),
			
			emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
			emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
			emailInfoLabelCenterYConstraint,
			
			emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
			emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
			emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
			emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
			
			emailValidationLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 3),
			emailValidationLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
			emailValidationLabel.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 53),
			
			passwordView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			passwordView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 18),
			passwordViewHeightConstraint,
			
			passwordTextFieldView.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
			passwordTextFieldView.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
			passwordTextFieldView.topAnchor.constraint(equalTo: passwordView.topAnchor),
			passwordTextFieldView.heightAnchor.constraint(equalToConstant: 48),
			
			passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
			passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
			passwordInfoLabelCenterYConstraint,
			
			passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
			passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
			passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
			passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
			
			passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
			passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
			passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
			
			passwordValidationLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 3),
			passwordValidationLabel.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
			passwordValidationLabel.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 53),
			
			loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
			loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
			loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 18),
			loginButton.heightAnchor.constraint(equalToConstant: 48)
		])
	}
	
	// MARK: - validation
	func isValidEmail(value: String) -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		
		return emailTest.evaluate(with: value)
	}
	
	func isValidPhone(value: String) -> Bool {
		let PHONE_REGEX = #"[0-9]{3}\-[0-9]{4}\-[0-9]{4}"#
		let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
		
		return phoneTest.evaluate(with: value)
	}
	
	func isValidId(value: String) -> Bool {
		return isValidEmail(value: value) || isValidPhone(value: value)
	}
	
	func isValidPassword(value: String) -> Bool {
		let passwordRegEx =  ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
		let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
		
		return passwordTest.evaluate(with: value)
	}
	
}

// MARK: - textfield extension
extension LoginView: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		if textField == emailTextField {
			emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
			emailInfoLabel.font = .systemFont(ofSize: 11)
			emailInfoLabelCenterYConstraint.constant = -13
		}
		
		if textField == passwordTextField {
			passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
			passwordInfoLabel.font = .systemFont(ofSize: 11)
			passwordInfoLabelCenterYConstraint.constant = -13
		}
		
		UIView.animate(withDuration: 0.3) {
			self.containerView.layoutIfNeeded()
		}
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		if textField == emailTextField {
			emailTextFieldView.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
			
			if emailTextField.text == "" {
				emailInfoLabel.font = .systemFont(ofSize: 18)
				emailInfoLabelCenterYConstraint.constant = 0
			}
		}
		
		if textField == passwordTextField {
			passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
			
			if passwordTextField.text == "" {
				passwordInfoLabel.font = .systemFont(ofSize: 18)
				passwordInfoLabelCenterYConstraint.constant = 0
			}
		}
		
		UIView.animate(withDuration: 0.3) {
			self.containerView.layoutIfNeeded()
		}
		
		// MARK: - 아이디 valid 체크
		if textField == emailTextField {
			emailViewHeightConstraint.constant = 68
			containerViewHeightConstraint.constant = 68 * 2 + 48 + 18 * 2
			
			guard let id = textField.text else { return }
			
			if isValidId(value: id) {
				emailValidationLabel.textColor = .green
				emailValidationLabel.text = "올바른 형식입니다."
			} else {
				emailValidationLabel.textColor = .red
				emailValidationLabel.text = "올바른 이메일 또는 전화번호 형식이 아닙니다."
			}
		}
		
		// MARK: - 비밀번호 valid 체크
		if textField == passwordTextField {
			passwordViewHeightConstraint.constant = 68
			containerViewHeightConstraint.constant = 68 * 2 + 48 + 18 * 2
			
			guard let pw = textField.text else { return }
			
			if isValidPassword(value: pw) {
				passwordValidationLabel.textColor = .green
				passwordValidationLabel.text = "올바른 형식입니다."
			} else {
				passwordValidationLabel.textColor = .red
				passwordValidationLabel.text = "숫자+문자 포함해서 8~20글자 사이로 입력하세요."
			}
		}
		
		// MARK: - 로그인 버튼 활성화
		guard let email = emailTextField.text, let password = passwordTextField.text else { return }
		
		if !email.isEmpty, isValidId(value: email), !password.isEmpty, isValidPassword(value: password) {
			loginButton.backgroundColor = .red
			loginButton.isEnabled = true
		} else {
			loginButton.backgroundColor = .clear
			loginButton.isEnabled = false
		}
	}
	
	@objc func textFieldEditingChanged(textField: UITextField) {
		if textField.text?.count == 1 {
			if textField.text?.first == " " {
				textField.text = ""
				return
			}
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
