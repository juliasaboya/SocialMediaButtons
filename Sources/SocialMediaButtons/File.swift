//
//  File.swift
//  
//
//  Created by Júlia Saboya on 07/05/24.
//

import Foundation
import SwiftUI

struct A: View {
    var body: some View {
        Button(action: {
            print("tap")
        }, label: {
            Text("Button")
        })
        
        Button {
            print("tap")
        } label: {
            Text("Button")
        }
    }
    func printLetter(letter: String) -> Bool {
        print(letter)
        return true
    }
    let printLettter: ((String) -> Bool) = { letter in
        print(letter)
        return true
    }
    func runSomething(word: String, closure: (String) -> Bool) {
        closure(word)
    }
    func main() {
        runSomething(word: "hello", closure: {
            print($0)
            return true
        })
    }
}
class Calc {
    var soma: ((Int, Int) -> Int) = { a, b in
        return a + b
    }
    
    func operacaoMult(a: Int, b: Int, mult: Int, operacao: (Int, Int) -> Int) -> Int {
        let resultSoma = operacao(a, b)
        let resultMult = resultSoma * mult
        return resultMult
    }
    
    func main() {
        
        let somaMultiplicada = operacaoMult(a: 2, b: 3, mult: 5, operacao: soma)
        let subMultiplicada = operacaoMult(a: 2, b: 3, mult: 5, operacao: { $0 - $1 })
        let sub2Multiplicada = operacaoMult(a: 2, b: 3, mult: 5) { $0 - $1 }

        print(somaMultiplicada)
        print(subMultiplicada)
        print(sub2Multiplicada)
    }
}
