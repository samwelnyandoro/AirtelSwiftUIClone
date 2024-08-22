//
//  Discover.swift
//  AirtelClone
//
//  Created by Muktar Aisak on 22/08/2024.
//

import SwiftUI

struct Discover: View {
    var body: some View {
        VStack(spacing: 0) {
            header
            
            ScrollView {
                search
                horizontalScroll
                governmentServices
                foodElectronics
                health
                transport
                education
                newsPaper
                ntv
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private var header: some View {
        HStack(spacing: 20) {
            Image("logo")
                .resizable()
                .frame(width: 40, height: 50)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Aritel")
                    .fontWeight(.semibold)
                    .font(.title)
                    .fontDesign(.serif)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.red)
    }
    
    private func horizontals(title: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
            Text(title)
                .foregroundStyle(.blue)
        }
        .font(.subheadline)
        .padding(6)
        .padding(.horizontal, 14)
        .background(
            Capsule()
                .stroke(Color.black, lineWidth: 1.0)
        )
    }
    
    private var search: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Search")
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(
            Capsule()
                .stroke(Color.black, lineWidth: 1.0)
        )
        .padding(.horizontal, 10)
    }
    
    private var horizontalScroll: some View {
        ScrollView(.horizontal) {
            HStack {
                horizontals(title: "Government Services", systemImage: "building.columns")
                horizontals(title: "NHIF", systemImage: "stethoscope")
                horizontals(title: "Food, Electronics & Shopping", systemImage: "cart.fill")
                horizontals(title: "E-Citizen", systemImage: "globe")
            }
            .padding(10)
        }
        .scrollIndicators(.hidden)
    }
    
    private var governmentServices: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Government Services")
                .font(.headline)
            
            HStack(spacing: 40) {
                imageComponent(title: "eCitizen", imageName: "ec")
                imageComponent(title: "NHIF", imageName: "nh")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private var foodElectronics: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Food, Electronics & Shopping")
                .font(.headline)
            
            HStack(spacing: 40) {
                imageComponent(title: "Jumia", imageName: "jm")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private var health: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Health & Care")
                .font(.headline)
            
            HStack(spacing: 40) {
                imageComponent(title: "My Dawa", imageName: "dawa")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private var transport: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Transport & Travel")
                .font(.headline)
            
                HStack(spacing: 20) {
                    imageComponent(title: "Madaraka Express", imageName: "mad")
                    imageComponent(title: "Jambo Jet", imageName: "jambo")
                    imageComponent(title: "Nairobi Expressway", imageName: "express")
                    
                }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private var education: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Education")
                .font(.headline)
            
                HStack(spacing: 20) {
                    imageComponent(title: "Helb", imageName: "helb")
                }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private var newsPaper: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("eNewspaper")
                .font(.headline)
            
                HStack(spacing: 20) {
                    imageComponent(title: "Standard", imageName: "stan")
                    imageComponent(title: "Nation", imageName: "nation")
                }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private var ntv: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("News")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    imageComponent(title: "NTV", imageName: "ntv")
                    imageComponent(title: "Citizen", imageName: "stan")
                    imageComponent(title: "Nation", imageName: "nation")
                    imageComponent(title: "NTV", imageName: "ntv")
                }
            }
            .scrollIndicators(.hidden)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
    
    private func imageComponent(title: String, imageName: String) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: 80, height: 70)
                .shadow(radius: 3)
                .overlay {
                    VStack {
                        Image(imageName)
                            .resizable()
                    }
                }
            
            Text(title)
        }
    }
}


#Preview {
    Discover()
}
