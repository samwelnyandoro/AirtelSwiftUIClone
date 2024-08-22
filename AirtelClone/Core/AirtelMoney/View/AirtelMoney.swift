//
//  AirtelMoney.swift
//  AirtelClone
//
//  Created by Muktar Aisak on 21/08/2024.
//

import SwiftUI

struct AirtelMoney: View {
    @State private var showBalance: Bool = false
    @State private var qrcode: Bool = false
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                header
                accountBalanceView
                tranferAndCashout
                transferAndBillPayments
                favoritesTv
            }
        }
        .sheet(isPresented: $qrcode, content: {
            QRcode()
                .presentationDetents([.fraction(0.3)])
        })
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
                
                Text("money")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "qrcode.viewfinder")
                .font(.headline)
            Image(systemName: "bell.fill")
                .font(.headline)
                .padding(.trailing)
        }
        .foregroundStyle(.red)
    }
    
    private var accountBalanceView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 3)
            .frame(height: 150)
            .padding(.top, 8)
            .overlay {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Hussein |")
                                    Text("1234567")
                                }
                                .font(.subheadline)
                                
                                Text("Airtel Money Balance")
                                    .font(.headline)
                            }
                            
                            Spacer()

                            HStack {
                                Image(systemName: "qrcode")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .padding(4)
                                    .background(.red)
                                    .clipShape(Circle())
                                
                                Text("My QR")
                                    .font(.subheadline)
                            }
                            .onTapGesture {
                                qrcode.toggle()
                            }
                            .padding(6)
                            .background(
                                Capsule()
                                    .stroke(Color.red, lineWidth: 1.0)
                            )
                            
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("KES")
                                .font(.subheadline)
                            
                            Text("2,000.00")
                                .foregroundStyle(.black)
                                .font(.headline)
                                .blur(radius: showBalance ? 5 : 0)
                            
                            Image(systemName: showBalance ? "eye.slash" : "eye")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(.red)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation {
                                        showBalance.toggle()
                                    }
                                }
                            
                        }
                        
                        HStack(spacing: 10) {
                            topButtons(title: "Get Money", systemImage: "plus.circle")
                            topButtons(title: "Withdraw Cash", systemImage: "minus.circle")
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
    }
    
    private func topButtons(title: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
            Text(title)
        }
        .font(.caption)
        .foregroundStyle(.red)
        .padding(.horizontal, 20)
        .padding(10)
        .background(.red.opacity(0.3))
        .cornerRadius(10)
    }
    
    private var tranferAndCashout: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 3)
            .frame(height: 130)
            .padding(.horizontal)
            .padding(.top, 8)
            .overlay {
                VStack {
                    Text("Transfer & Cashout")
                        .padding(.top, 8)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.leading, 10)
                    
                    HStack {
                        quickActionButtons(imageName: "cart", title: "Buy Goods")
                        quickActionButtons(imageName: "cash-withdrawal", title: "Withdraw Cash")
                        quickActionButtons(imageName: "send-money", title: "Send Money to Any Network")
                        quickActionButtons(imageName: "down-chevron", title: "More Services")
                    }
                    
                }
            }
    }
    
    private func quickActionButtons(imageName: String, title: String) -> some View {
        VStack(alignment: .center) {
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
            
            Text(title)
                .font(.caption)
        }
    }
    
    private var quickActions: some View {
        LazyVGrid(columns: columns, spacing: 20, content: {
            quickActionButtons(imageName: "iphone", title: "Buy Airtime")
            quickActionButtons(imageName: "invoice", title: "Pay Bill")
            quickActionButtons(imageName: "layer", title: "Buy Bundles")
            quickActionButtons(imageName: "cart", title: "Buy Goods")
            quickActionButtons(imageName: "star", title: "My Favorites")
            quickActionButtons(imageName: "qr-code-scan", title: "Scan to Pay")
            quickActionButtons(imageName: "user", title: "Refer & Earn")
            quickActionButtons(imageName: "discover", title: "Discover")
        })
        .padding()
        
    }
    
    private var transferAndBillPayments: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 3)
            .frame(height: 220)
            .padding(.horizontal)
            .padding(.top, 8)
            .overlay {
                VStack {
                    Text("Recharge & Bill Payments")
                        .padding(.top, 8)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.leading, 10)
                    quickActions
                }
            }
    }
    
    private var favoritesTv: some View {
        HStack {
            favoritesComponent(title: "Manage Your", systemImage: "star")
            favoritesComponent(title: "My Expenses", systemImage: "chart.line.uptrend.xyaxis")
        }
    }

    private func favoritesComponent(title: String, systemImage: String) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(systemImage == "chart.line.uptrend.xyaxis" ? .green : .cyan)
            .frame(width: 180, height: 60)
            .padding(.top, 16)
            .overlay {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(title)
                        if title == "Manage Your" {
                            Text("Favorites")
                        }
                    }
                    .font(.subheadline)
                    
                    Image(systemName: systemImage)
                        .font(.subheadline)
                        .padding(8)
                        .background(.white.opacity(0.2))
                        .clipShape(Circle())
                }
                .foregroundStyle(.white)
                .font(.headline)
            }
    }
}

#Preview {
    AirtelMoney()
}
