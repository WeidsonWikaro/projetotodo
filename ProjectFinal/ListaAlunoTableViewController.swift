//
//  ListaAlunoTableViewController.swift
//  ProjectFinal
//
//  Created by Anderson Carlos Nunes on 13/01/2019.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import UIKit

class ListaAlunoTableViewController: UITableViewController {
    
    var alunoModel: AlunoModel!
    var tipoUsuarioEnum: TipoUsuarioEnum!
    var autenticarModel: AutenticarLoginModel!
    
    var alunoLista:Array<Aluno> = []
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inicializar()

    }
    
    func inicializar(){
        self.autenticarModel = AutenticarLoginModel()
        self.alunoModel = AlunoModel()
        self.alunoLista = alunoModel.ListarAluno()
        addButton.isEnabled = autenticarModel.isAdmin(tipoUsuarioEnum)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return alunoLista.count
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alunoLista = alunoModel.ListarAluno()
        self.tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Or to rotate and lock
        OrientationUtil.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
        OrientationUtil.lockOrientation(.all)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "telaEditar" {
            if let telaEditar = segue.destination as? InsertAlunoViewController {
                telaEditar.indexSelected = (sender as? Int)!
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Item select: \(indexPath.row)")
        self.performSegue(withIdentifier: "telaEditar", sender: indexPath.row)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myIdentifier", for: indexPath) as! AlunoTableViewCell
        
        cell.nomeAlunoLabel?.text = alunoLista[indexPath.row].studentDescription

        // Configure the cell...

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if (autenticarModel.isAdmin(tipoUsuarioEnum)) {
                alunoModel.deletarAluno(indexPath.row)
                self.alunoLista = alunoModel.ListarAluno()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
