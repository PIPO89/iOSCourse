//: Playground - noun: a place where people can play

import UIKit

//Como declarar una variable sin inicializacion
var nameWithOutInitialization: String?

//Como declarar una variable con inicializacion
var nameWithInitialization = "Name"

//Como declarar una constante con inicializacion
let nameConstant = "Name"


//Unwrap de variable opcional
nameWithOutInitialization = "Variable opcional"
//Forma incorrecta
print("La variable tiene \(nameWithOutInitialization!.characters.count) caracteres")
//Forma correcta
if let nameWithOutInitialization = nameWithOutInitialization {
    print("La variable tiene \(nameWithOutInitialization.characters.count) caracteres")
}

//Explicación de un Guard, es para validar campos
func explicacionGuard(value: String?) -> Bool {
    guard let _ = value else {
        return false
    }
    return true
}

explicacionGuard(value: nameWithOutInitialization)

public enum CampoFaltante : Int {
    case primero = 1, segundo
}

func validarCampos(campo1: String?, campo2: String?) -> CampoFaltante? {
    guard let _ = campo1 else {
        return CampoFaltante.primero
    }
    guard let _ = campo2 else {
        return CampoFaltante.segundo
    }
    return nil
}

validarCampos(campo1: nil, campo2: "LLENO")
validarCampos(campo1: "LLENO", campo2: nil)
validarCampos(campo1: nil, campo2: nil)
validarCampos(campo1: "LLENO", campo2: "LLENO")