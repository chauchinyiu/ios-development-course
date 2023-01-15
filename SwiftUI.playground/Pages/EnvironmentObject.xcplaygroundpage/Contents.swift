import SwiftUI
import PlaygroundSupport
 

class TemperatureSetting: ObservableObject {
    @Published var temp = 21.0
}

struct HeaterView: View {
    @EnvironmentObject var setting: TemperatureSetting

    var body: some View {
        Slider(value: $setting.temp, in: 0...100)
    }
}

struct TemperatureDisplayView: View {
    @EnvironmentObject var setting: TemperatureSetting

    var body: some View {
        Text("Temperature = \(setting.temp)")
    }
}

struct ContentView: View {
    var setting = TemperatureSetting()

    var body: some View {
        VStack {
            HeaterView()
            TemperatureDisplayView()
        }
        .environmentObject(setting)
    }
}

PlaygroundPage.current.setLiveView(ContentView())



