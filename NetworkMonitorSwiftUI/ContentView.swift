//
//  ContentView.swift
//  NetworkMonitorSwiftUI
//
//  Created by Marco Alonso on 19/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var monitor: NetworkMonitor
    
    var body: some View {
        VStack {
            Text("iOS Bootcamp Mx")
                .font(.title)
            
            Image(systemName: "house")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
        }
        .offlineAlert()
    }
}

#Preview {
    ContentView()
}

struct OfflineAlertView: ViewModifier {
    @EnvironmentObject var monitor: NetworkMonitor
    
    func body(content: Content) -> some View {
        content
        if !monitor.hasNetworkConnection {
            ZStack {
                VStack {
                    //Image(systemName: "wifi.exclamationmark.circle.fill")
                    Image("wifi")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(radius: 12)
                    
                    Text("You're offline!")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Turn on mobile data or connect to a Wi-Fi. Or just take a break and for a walk!")
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Button(action: {
                            if let url = URL(string: "App-Prefs:root=WIFI") {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                }                        }, label: {
                            Text("Settings")
                                .foregroundStyle(.black)
                                .frame(height: 24)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 1)
                                }
                                .shadow(radius: 4)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Ok")
                                .foregroundStyle(.white)
                                .frame(width: 40 ,height: 24)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.black)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white, lineWidth: 1)
                                }
                                .shadow(radius: 4)
                        })
                    }
                    .padding(.horizontal, 20)
                }
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
            }
            .frame(width: 300, height: 300)
            .padding()
            .transition(.move(edge: .leading))
        }
    }
}

extension View {
    func offlineAlert() -> some View {
        self.modifier(OfflineAlertView())
    }
}
