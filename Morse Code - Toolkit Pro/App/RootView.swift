import SwiftUI
import SwiftData

struct RootView: View {
    var body: some View {
        TabView {
            ConverterView()
                .tabItem {
                    Label("Converter", systemImage: "arrow.left.arrow.right")
                }

            TransmitView()
                .tabItem {
                    Label("Transmit", systemImage: "antenna.radiowaves.left.and.right")
                }

            VisualizerView()
                .tabItem {
                    Label("Visualizer", systemImage: "hand.tap")
                }
    
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }

            // PracticeView()
            //     .tabItem {
            //         Label("Practice", systemImage: "graduationcap")
            //     }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    RootView()
        .environment(\.modelContext, try! ModelContainer(for: MorseEntry.self, configurations: .init(isStoredInMemoryOnly: true)).mainContext)
}
