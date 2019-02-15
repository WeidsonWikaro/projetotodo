//
//  AlunoModel.swift
//  ProjectFinal
//
//  Created by Anderson Carlos Nunes on 13/01/2019.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import Foundation

class AlunoModel {
    
    var database = Database.instance()
    
    func inserirAluno(_ aluno: Aluno) {
        //database.insert(add: aluno)
         
        database.insert(add: aluno)
        //self.decode()
    }
    
    func deletarAluno(_ index: Int){
        database.delete(add: index)
    }
    
    func ListarAluno() -> Array<Aluno>{
        
        return database.list()
        
    }
    
    func update(_ aluno: Aluno,_ index: Int){
        database.update(aluno, index)
    }
   
    
    
    
}
