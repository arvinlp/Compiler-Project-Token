//
//  ViewController.swift
//  Compiler Project Token
//
//  Created by Arvin Loripour on 9/25/1396 AP.
//  Copyright © 1396 AP Arvin Loripour. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var editText: UITextField!
    
    var new_srt:String = " ";
    var next_char:String = " ";
    var end_str:Bool = false;
    var my_string_main:String = "";
    var my_output:[String] = []
    
    @IBAction func Check(_ sender: Any) {
        
        // Clear My OutPut And Table View
        my_output = []
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
        
        // Get String
        my_string_main = editText.text!;
        let count = (editText.text?.count)!-1;
        
        // Strat Prosseces On String
        for i in 0 ... count
        {
            let index = my_string_main.index(my_string_main.startIndex, offsetBy: i)
            
            if(i<count-1){
                let index_next = my_string_main.index(my_string_main.startIndex, offsetBy: i+1);
                next_char = String(my_string_main[index_next]);
                functionCheckin (member: String(my_string_main[index]));
                
            }else{
                functionCheckinEnd(member: String(my_string_main[index]));
            }
        }
        
        // Load Tokens in Table View
        DispatchQueue.main.async(execute: {
            self.my_output.append("Arvin Loripour : Programmer")
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        my_output = ["Arvin Loripour : Programmer","http://www.ArvinLP.ir"]
        
        // Hidden Keyboard When Click on Done in TextField
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return my_output.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! TableViewCell
        cell.cellLabel?.text = my_output[indexPath.item]
        return cell
    }
    
    // Check Last Character
    func functionCheckinEnd (member:String){
        if(functionCheckOpr(check_str: member)){
            new_srt += member;
            new_srt += " : Opr";
            
            // Add new_str to my_output List
            my_output.append(new_srt);
            
            // Clear new_str for next check
            new_srt = "";
        }else{
            new_srt += member;
            
            // Function Check Token Type : loop, Number, Letter
            functionCheckTokenType(check_str: new_srt);
            
            // Add new_str to my_output List
            my_output.append(new_srt);
            
            // Clear new_str for next check
            new_srt = "";
        }
    }
    
    // Check Characters
    func functionCheckin (member:String){
        // Characters is Opration ?
        if(functionCheckOpr(check_str: member)){
            
            // Character is Opration ?
            // true Continue add next opration for example current Character is = next Character is > so new_str in next run is =>
            // false for example current Character is =  so new_srt is = : Opr
            
            if(functionCheckOpr(check_str: next_char)){
                new_srt += member;
            }else{
                new_srt += member;
                new_srt += " : Opr";
                
                // Add new_str to my_output List
                my_output.append(new_srt);
                
                // Clear new_str for next check
                new_srt = "";
            }
            
        }else
            // Characters Type is ?
            if(functionCheckOpr(check_str: next_char)){
                new_srt += member;
                
                // Function Check Token Type : loop, Number, Letter
                functionCheckTokenType(check_str: new_srt);
                
                // Add new_str to my_output List
                my_output.append(new_srt);
                
                // Clear new_str for next check
                new_srt = "";
            }else{
                new_srt += member;
        }
    }
    
    func functionCheckOpr (check_str:String)->Bool{
        
        // Character is Opration ???
        
        if(check_str == ">" ||
            check_str == "<" ||
            check_str == "=" ||
            check_str == "+" ||
            check_str == "-" ||
            check_str == "/" ||
            check_str == "*" ||
            check_str == "!" ||
            check_str == ")" ||
            check_str == "(" ||
            check_str == "}" ||
            check_str == "{"){
            return true;
        }else{
            return false;
        }
        
    }
    
    func functionCheckTokenType (check_str:String){
        
        // Character type is ???
        if(check_str.range(of:"0") != nil ||
            check_str.range(of:"1") != nil ||
            check_str.range(of:"2") != nil ||
            check_str.range(of:"3") != nil ||
            check_str.range(of:"4") != nil ||
            check_str.range(of:"5") != nil ||
            check_str.range(of:"6") != nil ||
            check_str.range(of:"7") != nil ||
            check_str.range(of:"8") != nil ||
            check_str.range(of:"9") != nil){
            new_srt += " : Number";
        }else if(check_str.range(of:"if") != nil){
            new_srt += " : if";
        }else if(check_str.range(of:"else") != nil){
            new_srt += " : else";
        }else if(check_str.range(of:"while") != nil){
            new_srt += " : while";
        }else if(check_str.range(of:"do") != nil){
            new_srt += " : do";
        }else if(check_str.range(of:"for") != nil){
            new_srt += " : for";
        }else if(check_str.range(of:"switch") != nil){
            new_srt += " : switch";
        }else if(check_str.range(of:"case") != nil){
            new_srt += " : case";
        }else{
            new_srt += " : id";
        }
        
    }
    
}
