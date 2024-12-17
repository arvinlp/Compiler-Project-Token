//
//  main.cpp
//  token
//
//  Created by Arvin Loripour on 9/24/1396 AP.
//  Copyright © 1396 AP Arvin Loripour. All rights reserved.
//
//
//  Test = if(a+b*2>67-M*3)
//

#include <iostream>
#include <string>
using namespace std;

string new_srt = " ";
char next_char;
bool end_str = false;
string my_string_main = "";

void functionCheckTokenType (string check_str);
bool functionCheckOpr (char check_str);
void functionCheckin (char member);
void functionCheckinEnd (char member);

void functionCheckTokenType (string check_str){
    
    if(check_str.find('0') != std::string::npos |
       check_str.find('1') != std::string::npos |
       check_str.find('2') != std::string::npos |
       check_str.find('3') != std::string::npos |
       check_str.find('4') != std::string::npos |
       check_str.find('5') != std::string::npos |
       check_str.find('6') != std::string::npos |
       check_str.find('7') != std::string::npos |
       check_str.find('8') != std::string::npos |
       check_str.find('9') != std::string::npos){
        new_srt += " : Number";
    }else if(check_str.find("if") != std::string::npos){
        new_srt += " : if";
    }else if(check_str.find("else") != std::string::npos){
        new_srt += " : else";
    }else if(check_str.find("while") != std::string::npos){
        new_srt += " : while";
    }else if(check_str.find("do") != std::string::npos){
        new_srt += " : do";
    }else if(check_str.find("for") != std::string::npos){
        new_srt += " : for";
    }else if(check_str.find("switch") != std::string::npos){
        new_srt += " : switch";
    }else if(check_str.find("case") != std::string::npos){
        new_srt += " : case";
    }else{
        new_srt += " : id";
    }
    
}

bool functionCheckOpr (char check_str){
    
    if(check_str == '>'|
       check_str == '<'|
       check_str == '='|
       check_str == '+'|
       check_str == '-'|
       check_str == '/'|
       check_str == '*'|
       check_str == '!'|
       check_str == ')'|
       check_str == '('|
       check_str == '}'|
       check_str == '{'){
        return true;
    }else{
        return false;
    }
    
}

void functionCheckin (char member){
    if(functionCheckOpr(member)){
        if(functionCheckOpr(next_char)){
            new_srt += member;
        }else{
            new_srt += member;
            new_srt += " : Opr";
            cout << new_srt;
            cout << endl;
            new_srt = "";
        }
    }else if(functionCheckOpr(next_char)){
        new_srt += member;
        
        // Function Check Token Type : loop, Number, Letter
        functionCheckTokenType(new_srt);
        
        cout << new_srt;
        cout << endl;
        new_srt = "";
    }else{
        new_srt += member;
    }
}

void functionCheckinEnd (char member){
    if(functionCheckOpr(member)){
        new_srt += member;
        new_srt += " : Opr";
        cout << new_srt;
        cout << endl;
        new_srt = "";
    }else{
        new_srt += member;
        
        // Function Check Token Type : loop, Number, Letter
        functionCheckTokenType(new_srt);
        
        cout << new_srt;
        cout << endl;
        new_srt = "";
    }
}

int main(){
    cin >> my_string_main;
    cout << endl;
    for (unsigned i=0; i<my_string_main.length(); ++i)
    {
        if(i<my_string_main.length()-1){
            next_char = my_string_main.at(i+1);
            functionCheckin (my_string_main.at(i));
        }else{
            functionCheckinEnd(my_string_main.at(i));
        }
    }
    cout << endl;
    cout << "Have Nice Day !";
    cout << endl;
}

