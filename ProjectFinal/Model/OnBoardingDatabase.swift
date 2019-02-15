//
//  OnBoardingDatabase.swift
//  ProjectFinal
//
//  Created by Halyson Ribeiro Pessoa on 11/02/2019.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import Foundation

class OnBoardingDataBase {
    
    static let shared = OnBoardingDataBase()
    
    public init(){}
    
    func insert(_ value: String) {
        
        var lista = list()
        lista.insert(value, at: 0)
        setValue(lista)
    }
    
    func setValue(_ listAlunos: Array<String>){
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: listAlunos)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: "onboarding")
        
    }
    
    
    
    func delete(add index: Int) {
        var storage = list()
        
        storage.remove(at: index)
        setValue(storage)
        
    }
    
    func update(_ value: String,_ index: Int){
        var storage = list()
        storage[index] = value
        setValue(storage)
        
    }
    
    func list() -> Array<String>{
        
        if let decoded  = UserDefaults.standard.object(forKey: "onboarding") as? Data{
            
            return NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [String] ?? [String]()
        }
        return []
    }
    
    
    
    
    static func instance() -> OnBoardingDataBase {
        return self.shared
}

}
