// Playground - noun: a place where people can play

import UIKit

var array = ["uno","dos","tres","cuatro"]for elemento in array {    println(elemento)
}


var array2 = [1,2,3,4,5,6,7,8,9,10];



func example1(enteros: NSArray) {
    
    var numero:NSInteger = 0
    
    for elemento in enteros{
    numero += (elemento as NSNumber).integerValue
    }
    
    println("La suma de los valores del array es: \(numero)")
    
    
}


example1(array2)




func example2() -> NSMutableArray {
    
    var array = NSMutableArray()

    
    for var i = 11; i<=20; i++ {
    array.addObject(i)
    
    }
    
    return array
    
}


var array3 = example2()
//mostramos la suma de los valores del nsmutable array
example1(array3)



//elimina elementos pares de un array
func example3()  {
    
    var array = example2()
    
    
    
    for var i = 0; i<array.count; i++ {
        if ((array.objectAtIndex(i) as Int % 2) == 0){
        array.removeObjectAtIndex(i)
        }
    }
    
    //imprimo la suma de los elementos pares del array
    example1(array)
    
}



















