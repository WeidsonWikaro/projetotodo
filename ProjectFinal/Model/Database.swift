import Foundation

class Database {
    
    static let shared = Database()
    
    public init(){}
    
    func insert(add aluno: Aluno) {
        
        var lista = list()
        lista.insert(aluno, at: 0)
        setValue(lista)
    }
    
    func setValue(_ listAlunos: Array<Aluno>){
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: listAlunos)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: "Aluno")
        
    }
    
    
    
    func delete(add index: Int) {
        var storage = list()
        
        storage.remove(at: index)
        setValue(storage)
        
    }
    
    func update(_ aluno: Aluno,_ index: Int){
        var storage = list()
        storage[index] = aluno
        setValue(storage)
        
    }
    
    func list() -> Array<Aluno>{
        
        if let decoded  = UserDefaults.standard.object(forKey: "Aluno") as? Data{
            
            return NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Aluno] ?? [Aluno]()
        }
        return []
    }
    
    
    
    
    static func instance() -> Database {
        return self.shared
    }
}
