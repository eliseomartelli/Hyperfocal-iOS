//
//  View.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeState: HomeState = HomeState()
    var body: some View {
        List {
            
            NavigationLink {
                HyperfocalView()
            } label: {
                VStack(alignment: .leading) {
                    Text("Hyperfocal").bold()
                    Text("Get the hyperfocal distance for your lens.")
                }
            }
            
            NavigationLink {
                StarruleView()
            } label: {
                VStack(alignment: .leading) {
                    Text("500 Rule").bold()
                    Text("Long exposure of the stars, without trails.")
                }
            }
            
            
        }
        .navigationTitle(Bundle.main.displayName!)
        .environmentObject(homeState)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
