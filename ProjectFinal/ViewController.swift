//
//  ViewController.swift
//  ProjectFinal
//
//  Created by Anderson Carlos Nunes on 13/01/2019.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtSenha: UITextField!
    var autenticar: AutenticarLoginModel!
    
    var tipoUsuarioEnum = TipoUsuarioEnum.Invalid

    var onboardingModel = OnBoardingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.autenticar = AutenticarLoginModel()
        
        if onboardingModel.listar().count == 0 {
            getOnboarding() 
            onboardingModel.inserir("S")
        }
    }
    
    func getOnboarding() {
        
        if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listaAlunoView = segue.destination as! ListaAlunoTableViewController
       listaAlunoView.tipoUsuarioEnum = self.tipoUsuarioEnum
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if let usuario = self.txtUsuario.text,
            let senha = self.txtSenha.text {
            
            self.tipoUsuarioEnum = autenticar.efetuarLogin(usuario, senha)
            
            return autenticar.validarTipoUsuario(tipoUsuarioEnum)
        }
        return false
    }


}

