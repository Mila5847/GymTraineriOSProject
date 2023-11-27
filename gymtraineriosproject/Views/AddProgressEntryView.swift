import SwiftUI

struct AddProgressEntryView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModelProgress: ClientProgressViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigatingToClientProgress = false
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Date", selection: $viewModelProgress.date, displayedComponents: .date)
                    TextField("Current Weight", text: $viewModelProgress.weightString)
                        .keyboardType(.decimalPad)
                }.background(.white)
            }
        }
        .navigationBarTitle("Add Progress Entry", displayMode: .inline)
        .background(.white)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Invalid Weight"), message: Text("Please enter a valid weight with only numbers."), dismissButton: .default(Text("OK")))
        }
        HStack {
            Button(action: {
                isPresented = false
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Button(action: {
                if let weight = Double(viewModelProgress.weightString) {
                    // Valid weight, proceed with saving
                    viewModelProgress.addProgressEntry()
                    presentationMode.wrappedValue.dismiss()
                    isNavigatingToClientProgress = true
                } else {
                    // Invalid weight, show alert
                    showAlert = true
                }
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}


