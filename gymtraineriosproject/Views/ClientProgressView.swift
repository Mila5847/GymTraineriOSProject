import SwiftUI
import SwiftUICharts

struct DateWeightEntry {
    var date: Date
    var weight: Double

    init(date: Date, weight: Double) {
        self.date = date
        self.weight = weight
    }
}

struct DateWeightView: View {
    let date: Date
    let weight: Double

    var body: some View {
        HStack {
            Text("Date: \(date, style: .date)")
            Spacer()
            Text("Weight: \(String(format: "%.2f", weight)) kg")
        }
    }
}

struct ProgressChartView: View {
    var data: [Double]
    var dates: [Date]

    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Text("Weight")
                        .frame(width: geometry.size.width, alignment: .center)
                        .padding(.bottom, 5)

                    LineView(data: data,
                             title: "Weight Progress",
                             legend: "Weight",
                             style: ChartStyle(backgroundColor: Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)),
                                               accentColor: .blue,
                                               secondGradientColor: .green,
                                               textColor: .black,
                                               legendTextColor: .blue,
                                               dropShadowColor: .gray),
                             valueSpecifier: "%.2f")
                        .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)))
                }
            }
        }
    }
}

struct ClientProgressView: View {
    @ObservedObject var viewModel: ClientProgressViewModel
    @State private var newDate = Date()
    @State private var newWeight = 0.0
    @State private var isShowingForm = false
    @State private var isShowingChart = false
    @AppStorage("isDarkMode") private var isDark = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack {
                Text("Client: \(viewModel.client.name)")
                    .font(.title)
                    .padding()

                Text("Current Weight \(String(format: "%.2f", viewModel.client.weight))")
                Text("Weight Goal \(String(format: "%.2f", viewModel.client.weightGoal))")

                if viewModel.client.weight == viewModel.client.weightGoal {
                    CompleteGoalView()
                }
                if viewModel.client.weight - viewModel.client.weightGoal > 0 {
                    Text("Goal: Lose \(String(format: "%.2f", viewModel.client.weight - viewModel.client.weightGoal)) kilograms")
                        .font(.headline)
                        .padding()
                } else {
                    Text("Goal: Gain \(String(format: "%.2f", viewModel.client.weightGoal - viewModel.client.weight)) kilograms")
                        .font(.headline)
                        .padding()
                }
        
                List {
                    ForEach(viewModel.sortedProgressEntries) { entry in
                        DateWeightView(date: entry.date, weight: entry.weight)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)))
                .padding(.bottom, 10)
                
                Spacer()
                Button(action: {
                                    isShowingChart.toggle()
                                }) {
                                    Text("Get Progress Chart")
                                        .fontWeight(.bold)
                                        .foregroundColor(isDark ? .white : .black)
                                }
                                .sheet(isPresented: $isShowingChart, content: {
                                    ProgressChartView(data: viewModel.sortedProgressEntries.map { $0.weight }.reversed(),
                                                      dates: viewModel.sortedProgressEntries.map { $0.date }.reversed())
                                })

                Button(action: {
                    isShowingForm.toggle()
                }) {
                    Text("Add Progress Entry")
                        .fontWeight(.bold)
                        .foregroundColor(isDark ? .white : .black)
                }
            }
            .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)))
            .navigationTitle("Client Progress")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "chevron.left.circle")
                            .imageScale(.large)
                            .foregroundColor(isDark ? .white : .black)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Text("Back")
                            .foregroundColor(isDark ? .white : .black)
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingForm, content: {
            AddProgressEntryView(isPresented: $isShowingForm, viewModelProgress: viewModel)
        })
    }
}


