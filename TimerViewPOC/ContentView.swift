//
//  ContentView.swift
//  TimerViewPOC
//
//  Created by Guru Mahan on 07/02/23.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    /*
    @State var currentDate : Date = Date()
  
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    @State var timerRemining: String = ""
    let furtureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimerRemining(){
        let remaining = Calendar.current.dateComponents([.hour,.minute,.second], from: Date(), to: furtureDate)
        let hour = remaining.hour ?? 0
        let minutes = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timerRemining = "\(hour):\(minutes):\(second)"
    }
    
    var body: some View {
        ZStack{
            Text(timerRemining )
        }.onReceive(timer, perform: {value in
            updateTimerRemining()
        })
    }
    
    
/*
    @State private var startDate = Date()
      private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

      var body: some View {
          Text("\(timeElapsedString)")
              .onAppear {
                  self.startDate = Date()
              }
              .onReceive(timer) { _ in
                  self.startDate = Date()
              }
      }

      private var timeElapsedString: String {
          let components = Calendar.current.dateComponents([.hour, .minute, .second], from: startDate, to: Date())

          return String(format: "%02ld:%02ld:%02ld", components.hour ?? 0, components.minute ?? 0, components.second ?? 0)
      }
     @State  var count = 10
      @State private var timer: Timer?
     @State var startTimer = false
    @State var stopTimer = false
      var body: some View {
          ZStack {
              if startTimer == true{
                  Text("\(count)")
              }
              if stopTimer == true{
                  Text("finished")
              }

        }.onAppear{
              if count == 10 {
                  startTimer = true
                  self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                      self.count -= 1
                      if count == 0{

                          self.timer?.invalidate()
                          self.timer = nil
                          startTimer = false
                          stopTimer = true
                      }
                  }
              }
          }

      }
    
    @State private var count = 0

       var body: some View {
           Text("\(count)")
               .onAppear {
                   Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                       self.count += 1
                   }
               }
       }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
