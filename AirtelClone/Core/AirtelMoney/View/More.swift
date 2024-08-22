//
//  More.swift
//  AirtelClone
//
//  Created by Muktar Aisak on 22/08/2024.
//

import SwiftUI

struct More: View {
    @State private var showTransactions: Bool = false
    @State private var airtelMoney: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("v1.3.46")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Image(systemName: "person.fill")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .padding()
                    .background(Circle().fill(.gray.opacity(0.2)))
                Text("Hussein Aisak")
                    .font(.headline)
                
                HStack {
                    Text("1234567-")
                    Text("PREPAID")
                        .fontDesign(.serif)
                }
                .font(.subheadline)
            }
            .padding()
            .background(
                AngularGradient(colors: [.red, .green, .green, .cyan], center: .topLeading, angle: Angle(degrees: 55))
            )
            
            ScrollView {
                VStack(spacing: 20) {
                    VStack(spacing: 20)  {
                        HStack {
                            Image("logo")
                                .resizable()
                                .frame(width: 40, height: 40)
                        
                            Text("Airtel Prepaid Services")
                            
                            Spacer()

                            Image(systemName: showTransactions ? "chevron.up" : "chevron.down")
                        }
                        .onTapGesture {
                            withAnimation(.none) {
                                showTransactions.toggle()
                            }
                        }
                        
                        if showTransactions {
                            VStack(alignment: .leading, spacing: 20) {
                              listComponents(name: "Transaction History", imageName: "arrow.triangle.2.circlepath.circle")
                                
                                listComponents(name: "Scratch Card Recharge", imageName: "menucard.fill")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 6)
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                    VStack(spacing: 12) {
                        HStack {
                            Image(systemName: "wallet.pass.fill")
                                .font(.title3)
                                .padding(.leading)
                        
                            Text("Airtel Money Services")
                            
                            Spacer()

                            Image(systemName: airtelMoney ? "chevron.up" : "chevron.down")
                        }
                        .onTapGesture {
                            withAnimation(.none) {
                                airtelMoney.toggle()
                            }
                        }
                        
                        if airtelMoney {
                            VStack(alignment: .leading, spacing: 20) {
                              listComponents(name: "Transaction History", imageName: "arrow.triangle.2.circlepath.circle")
                                
                                listComponents(name: "PIN Management", imageName: "lock.circle")
                                listComponents(name: "Our services", imageName: "iphone.gen1")
                                listComponents(name: "Airtel Money Terms and Conditions", imageName: "book.pages.fill")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 6)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    Divider()
                    listComponents(name: "Notification Inbox", imageName: "bell")
                    Divider()
                    listComponents(name: "Settings", imageName: "gear")
                    Divider()
                    listComponents(name: "Check Network Coverage", imageName: "antenna.radiowaves.left.and.right")
                    Divider()
                    listComponents(name: "Airtel shops", imageName: "building.2.crop.circle.fill")
                    Divider()
                    listComponents(name: "Help and Support", imageName: "phone.circle.fill")
                }
                .font(.title3)
            }
            
        }
    }
    
    
    func listComponents(name: String, imageName: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: imageName)
                    .foregroundStyle(.blue.opacity(0.8))
                Text(name)
                
                Spacer()
            }
        }
        .padding(.horizontal, 28)
        
    }
}

#Preview {
    More()
}
