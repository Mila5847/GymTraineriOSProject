import SwiftUI
struct CurrentClientsView: View {
    @ObservedObject var viewModel: CurrentClientsViewModel
    @State private var isAddingClient = false

    init(viewModel: CurrentClientsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                // Existing Client List
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.clients) { client in
                            HStack {
                                Text(client.name)
                                    .font(.system(size: 20, weight: .regular))
                                    .padding()

                                Spacer()

                                Button(action: {
                                    // Remove the client from the view model
                                    viewModel.removeClient(client)
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                                .padding(.trailing, 20)
                                .font(.system(size: 20))
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Current Clients")
            .onAppear {
                // Reset the flag when the view appears to enable navigation
                isAddingClient = false
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Set the flag to true to trigger the navigation
                        isAddingClient = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}



