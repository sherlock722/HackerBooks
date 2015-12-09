//
//  AGTLibraryTableViewController.swift
//  HackerBooks
//
//  Created by Javier Cazorla Moriche on 8/12/15.
//  Copyright © 2015 FJC. All rights reserved.
//

import UIKit

class AGTLibraryTableViewController: UITableViewController {

    
    //Funcion que extrae el JSON de Libros y devuelve un Array de su representacion estricta
    
    private func decodeJSON() -> [StrictAGTBook]?{ //[StrictAGTBook]
        
        //Obtener la URL del fichero (puede salir mal)
        //Se recupera la información de JSON y lo pasamos a un NSData (puede salir mal)
        //Se parsea
        let results : [StrictAGTBook]? = nil
        //let results = [StrictAGTBook] ()
        
        
        do{
            if let url = NSBundle.mainBundle().URLForResosurce("books_readable.json"), data = NSData(contentsOfURL: url), booksArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{
                
                //Todo OK
                return decode(agtBooks: booksArray)
                
                
            }
        }catch{
            //Error al parsear el JSON
            print ("Error al parsear el JSON")
            //fatalError()
            
        }
        return results
        
    }
    
    
    //Crear un let al modelo y se le define el valor por defecto (se inicializa)
    //Crear el modelo de AGTLibrary
    var model : AGTLibrary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Crear el modelo
        if let books = decodeJSON(){//Si fuera un opcional
        
            model = AGTLibrary (books: books) //model es un opcional
        }else {
            
            print ("Error al desempaquetar el modelo")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       
        return (model?.tagsCount)!
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //Sacar el tag
        
        let ip = self.tableView.indexPathForSelectedRow
        let book = model![(ip?.row)!, inTag:tagName(index: (ip?.section)!)]

        
        //return (model?.bookCountForTag(book?.tags).description
        return 0
    }
    
    
    //Implementamos el siguiente método
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //COMPLETAR
        return nil
    }
    
    

    //Celda
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId="AGTBookCell"
        
        
        // Configure the cell...
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)


        if cell == nil {

            //Creo la celda
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        }
        
        //obtener el libro
        let book = model![indexPath.row, inTag:tagName(index: indexPath.section)]
        
        //Configurar la celda
            cell?.textLabel?.text=book?.titulo
            //cell?.detailTextLabel?.text=book?.
        
        
        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Segues
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        return true
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Sender : En nuestro caso es la celda que produce la accion de ir al controlador detalle del
        //book
        
        //Mandamos al controlador destino, en este caso el detalle del book el modelo
        
        //Averiguar si el segue en cuestion es el correcto
        if segue.identifier == "showBook"{
            
            //Cual es el controlador destino
            let destVC=segue.destinationViewController as? BookViewController
            
            let ip = self.tableView.indexPathForSelectedRow
            let book = model![(ip?.row)!, inTag:tagName(index: (ip?.section)!)]
            destVC?.model = book
        
        }


    }
}