//
//  ContentView.swift
//  We Split
//
//  Created by Gayan Kalinga on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var noOfPeople = "2"
    @State private var selectedTip = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalBill: Double {
        let amount = Double(billAmount) ?? 0.0
        let tip = Double(tipPercentages[selectedTip])
        print(tipPercentages[selectedTip])
        let total = amount + amount * tip / 100.0
        return total
    }
    
    var amountPerPerson: Double{
        let sharedBy = Double(noOfPeople) ?? 2.0
        return totalBill / sharedBy
    }
    
    func saveDetail(){
        print("Detail Saved")
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Total Bill Amount")){
                    TextField("Bill Amount", text: $billAmount)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("No of Peoples")){
                    TextField("No of People", text: $noOfPeople)
                        .keyboardType(.numberPad)
  
                }
                
                Section(header: Text("Tip Percentage")){
                    Picker("Tip Percentage", selection: $selectedTip){
                        ForEach( 0 ..< tipPercentages.count){ item in
                              Text("\(tipPercentages[item])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Per Person")){
                    Text("\(amountPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total Bill")){
                    Text("\(totalBill, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("We Split", displayMode: .automatic)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        saveDetail()
                    }label: {
                        Text("Save")
                    }
                }
            }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
