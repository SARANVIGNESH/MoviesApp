//
//  LoginView.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 31/07/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var isValidEmail: Bool = false
    @State private var isValidPassword: Bool = false
    @State private var isLinkActive = false
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Movies App")
                .font(.largeTitle)
                .padding(.leading, 100)
                .fontWeight(.bold)
            Text("Email ID")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            TextFieldView(text: $emailInput, placeholder: "", isSecure: false, commitAction: {
                
            }, editingChangedAction: { _ in
                isValidEmail = isValidEmailFormat(emailInput)
            })
            .textFieldStyle(LineTextFieldStyle())
            Text("Password")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            TextFieldView(text: $passwordInput, placeholder: "", isSecure: true, commitAction: {
                isValidPassword = isValidPasswordFormat(passwordInput)
            }, editingChangedAction: { _ in
                
            })
            .textFieldStyle(LineTextFieldStyle())
            
            ButtonView(title: "Login", backgroundColor: .blue, textColor: .white, action: {
                print("btn tapped")
                self.login()
            })
            .frame(maxWidth: .infinity)
            .padding()
            .disabled(!isValidEmail || !isValidPassword)
            NavigationLink(destination: MovieView(), isActive: $isLinkActive) {
                EmptyView()
            }
            
            HStack {
                Spacer()
                Text("Don't have an account?")
                    .fontWeight(.semibold)
                Spacer()
                ButtonView(title: "Create Account", backgroundColor: .clear, textColor: .blue, action: {
                    print("account tapped")
                })
                Spacer()
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
        .background(Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
        )
    }
    
    private func isValidEmailFormat(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func isValidPasswordFormat(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    private func login() {
        print("Login tapped with email: \(emailInput) and password: \(passwordInput)")
        isLinkActive = true
    }
    
}



