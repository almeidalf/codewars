func disariumNumber(_ number: Int) -> String {

	let transformString : String = String(number)
    var result: Decimal = 0
    var contador : Int = 1
    let recorteNumero = transformString.compactMap{$0}
	
    for num in recorteNumero{
        let transform : Decimal = Decimal(string: num.description)!
        result += pow(transform, contador)
        contador += 1
    }
        if(result == Decimal(number)){
            return "Disarium !!"
        }else{
            return "Not !!"
        }
}