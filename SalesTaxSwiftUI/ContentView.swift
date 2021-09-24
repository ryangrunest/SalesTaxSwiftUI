//
//  ContentView.swift
//  SalesTaxSwiftUI
//
//  Created by Ryan Grunest on 9/24/21.
//

import SwiftUI

struct ContentView: View {
    @State var beforeTaxPrice = "742";
    @State var taxRate = "4.7";
    @State var afterTaxPrice = "776.874"
    
    var body: some View {
        VStack {
            Text("Sales Tax Calculator").font(.largeTitle).foregroundColor(.blue)
            HStack {
                Text("Before Tax Price")
                TextField("$0", text: $beforeTaxPrice).keyboardType(.decimalPad)
            }
            .padding(.top, 24.0)
            HStack {
                Text("Sales Tax Rate")
                TextField("4.7%", text: $taxRate)
            }
            HStack {
                Text("After Tax Price")
                TextField("776.874", text: $afterTaxPrice).disabled(true)
            }
            VStack(alignment: .trailing) {
                Button("Calculate") {
                    if let beforeTax = Float(beforeTaxPrice),
                       let tax = Float(taxRate) {
                        let salesTax = beforeTax * tax / 100
                        afterTaxPrice = String(beforeTax + salesTax)
                    }
                }
                .padding()
                .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.pink/*@END_MENU_TOKEN@*/)
                
            }.padding(.top, 12)
            Spacer()
        }.padding(.horizontal, 12.0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
