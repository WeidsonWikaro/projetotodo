//
//  OnBoardingModel.swift
//  ProjectFinal
//
//  Created by Halyson Ribeiro Pessoa on 11/02/2019.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import Foundation


class OnBoardingModel {
    
    var database = OnBoardingDataBase.instance()
    
    func inserir(_ txt: String) {
        database.insert(txt)
        
        
    }
    
    func deletar(_ index: Int){
        database.delete(add: index)
    }
    
    func listar() -> Array<String>{
        
        return database.list()
        
    }
    
    func update(_ value: String,_ index: Int){
        database.update(value, index)
    }

}

