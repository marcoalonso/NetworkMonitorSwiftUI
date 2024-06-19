//
//  NetworkMonitor.swift
//  NetworkMonitorSwiftUI
//
//  Created by Marco Alonso on 19/06/24.
//

import SwiftUI
import Network

class NetworkMonitor: ObservableObject {
    // Reaccionar a los cambios
    private let networkMonitor = NWPathMonitor()
    @Published var hasNetworkConnection = true
    
    init() {
        // Llamará cada vez que cambie el estado de la red
        networkMonitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            // path.status internet ok, llamamos la func para actualizar var bool
            self.setNetworkConnection(connection: path.status == .satisfied)
        }
        networkMonitor.start(queue: DispatchQueue.global())
    }
    
    // Esta funcion será llamada por el closure en 2 plano
    private func setNetworkConnection(connection: Bool) {
        Task {
            // actualizar UI debemos cambiar al hilo principal
            @MainActor in
            withAnimation {
                hasNetworkConnection = connection
            }
        }
    }
}
