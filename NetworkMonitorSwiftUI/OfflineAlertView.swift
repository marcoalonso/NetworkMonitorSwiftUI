//
//  OfflineAlertView.swift
//  NetworkMonitorSwiftUI
//
//  Created by Marco Alonso on 19/06/24.
//

import SwiftUI

struct OfflineAlertView2: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "wifi.exclamationmark.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .shadow(radius: 12)
                
                Text("You're offline!")
                    .font(.title)
                    .bold()
                Text("Turn on mobile data or connect to a Wi-Fi. Or just take a break and for a walk!")
                    .multilineTextAlignment(.center)
                
                HStack {
                    Button(action: {
                        
                    }, label: {
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

#Preview {
    OfflineAlertView2()
}
