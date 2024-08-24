//
//  Home.swift
//  AirtelClone
//
//  Created by Muktar Aisak on 21/08/2024.
//

import SwiftUI

struct Home: View {
    @State private var showBalance: Bool = false
    @State private var showAll: Bool = false
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        VStack {
            header
            
            ScrollView {
                withShadow
                accountBalanceView
                
                HStack {
                    Text("Quick Actions")
                    Spacer()
                    Button("View All", action: {showAll.toggle()})
                }
                .padding(.top, 12)
                .padding(.horizontal)
                
                quickActions
                horizontalLoop
                bestOffers
                favoritesTv
                
            }
            .scrollIndicators(.hidden)
           
        }
        .padding(.horizontal)
        .sheet(isPresented: $showAll, content: {
            ViewAll()
                .presentationDetents([.medium, .large])
        })
    }
}

#Preview {
    NavigationStack {
        Home()
    }
}

extension Home {
    private var header: some View {
        HStack(spacing: 20) {
            Image("logo")
                .resizable()
                .frame(width: 40, height: 50)
            
            Text("Airtel")
                .fontWeight(.semibold)
                .font(.title)
                .fontDesign(.serif)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "qrcode.viewfinder")
                .font(.headline)
            Image(systemName: "bell.fill")
                .font(.headline)
        }
        .foregroundStyle(.red)
    }
    
    private var balanceView: some View {
        HStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("1, 030.42")
                Text("KES")
                    .font(.subheadline)
                    .foregroundStyle(.red)
                Text("Airtime Balance")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
            
            Rectangle()
                .fill(.gray)
                .frame(width: 1, height: 50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("0")
                Text("Mins")
                    .font(.subheadline)
                    .foregroundStyle(.red)
                Text("Voice Balance")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
            
            Rectangle()
                .fill(.gray)
                .frame(width: 1, height: 50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("0")
                Text("KB")
                    .font(.subheadline)
                    .foregroundStyle(.red)
                Text("Data Balance")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
        .padding(.horizontal)
    }
    
    private func topButtons(title: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
            Text(title)
        }
        .font(.subheadline)
        .foregroundStyle(.red)
        .padding(.horizontal, 20)
        .padding(10)
        .background(.red.opacity(0.3))
        .cornerRadius(10)
    }
    
    private var withShadow: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(.white)
            .frame(height: 220)
            .shadow(radius: 3)
            .overlay {
                VStack {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("Hussein Aisak")
                            Text("Prepaid - 12345678")
                        }
                        .font(.headline)
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        Button("Manage Account", action: {})
                            .foregroundStyle(.blue)
                            .padding(.trailing)
                    }
                    Divider()
                    balanceView
                    Divider()
                    HStack {
                        topButtons(title: "Buy Bundles", systemImage: "circle.square")
                        topButtons(title: "Self Recharge", systemImage: "bolt")
                    }
                }
            }
            .padding(.horizontal)
    }
    
    private var accountBalanceView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 3)
            .frame(height: 100)
            .overlay {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "book.closed")
                            Text("Airtel Money")
                        }
                        .font(.headline)
                        
                        HStack {
                            Text("KES")
                                .font(.subheadline)
                            ZStack {
                                Text("2,000.00")
                                    .foregroundStyle(.black)
                                    .blur(radius: showBalance ? 14 : 0)
                                
                            }
                        }
                        Text("Last updated at 11:55pm")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    .foregroundStyle(.red)
                    
                    Image(systemName: showBalance ? "eye" : "eye.slash")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(12)
                        .background(.red)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                showBalance.toggle()
                            }
                        }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
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
            quickActionButtons(imageName: "wifi-router", title: "Airtel 4G/5G WIFI")
            quickActionButtons(imageName: "iphone", title: "Buy Airtime")
            quickActionButtons(imageName: "invoice", title: "Pay Bill")
            quickActionButtons(imageName: "layer", title: "Buy Bundles")
            quickActionButtons(imageName: "cart", title: "Buy Goods")
            quickActionButtons(imageName: "cash-withdrawal", title: "Withdraw cash")
            quickActionButtons(imageName: "send-money", title: "Send Money To Any Network")
            quickActionButtons(imageName: "console", title: "Go GAMES")
        })
        .padding()
    }
    
    private var horizontalLoop: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width: 350, height: 140)
                        .overlay {
                            
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Group {
                                        Image("logo")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                        Text("Airtel")
                                    }
                                    Text("GB Kwa GB")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    Text("Vuka to Airtel na")
                                        .font(.subheadline)
                                    Text("Smart phone yako")
                                        .font(.subheadline)
                                    
                                    Text("To check eligibility dial * 544*8#")
                                        .font(.caption)
                                }
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                VStack(spacing: 120) {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 30, height: 6)
                                    
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 80, height: 6)
                                }
                            }
                            
                        }
                }
            }
            .padding(.horizontal)
            
        }
    }
    
    private var bestOffers: some View {
        VStack {
            HStack {
                Text("BEST OFFERS")
                    .font(.headline)
                    .foregroundStyle(.red)
                
                Spacer()
                
                Button("All Offers", action: {})
            }
            
            HStack(alignment: .center) {
                Image(systemName: "tag.fill")
                    .rotationEffect(Angle(degrees: -90))
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.purple)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("1 GB")
                    Text("Validity 1 hour")
                }
                
                Spacer()
                
                HStack {
                    Text("KES")
                        .foregroundStyle(.red)
                        .font(.headline)
                    
                    Text("15")
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var favoritesTv: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.cyan)
                .frame(width: 190, height: 70)
                .overlay {
                    HStack(alignment: .top, spacing: 20) {
                        VStack {
                            Text("Manage Your")
                            Text("Favorites")
                        }
                        
                        Image(systemName: "star.fill")
                            .font(.title2)
                            .padding(10)
                            .background(.white.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .foregroundStyle(.white)
                    .font(.headline)
                }
            
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .frame(width: 190, height: 70)
                .overlay {
                    HStack(alignment: .top, spacing: 20) {
                        VStack {
                            Text("Watch Live Tv")
                        }
                        
                        Image(systemName: "tv")
                            .font(.title2)
                            .padding(10)
                            .background(.white.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .foregroundStyle(.white)
                    .font(.headline)
                }
        }
        
    }
    
}


struct ViewAll: View {
    
    var body: some View {
        VStack {
            Text("Quick Actions")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 32)
            
            ViewAllProperties()

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
}


struct ViewAllProperties: View {
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20, content: {
            quickActionButtons(imageName: "wifi-router", title: "Airtel 4G/5G WIFI")
            quickActionButtons(imageName: "iphone", title: "Buy Airtime")
            quickActionButtons(imageName: "invoice", title: "Pay Bill")
            quickActionButtons(imageName: "layer", title: "Buy Bundles")
            quickActionButtons(imageName: "cart", title: "Buy Goods")
            quickActionButtons(imageName: "cash-withdrawal", title: "Withdraw cash")
            quickActionButtons(imageName: "send-money", title: "Send Money To Any Network")
            quickActionButtons(imageName: "console", title: "Go GAMES")
            quickActionButtons(imageName: "wallet", title: "Get Money")
            quickActionButtons(imageName: "card", title: "Scratch Cards")
            quickActionButtons(imageName: "star", title: "My Favorites")
            quickActionButtons(imageName: "qr-code-scan", title: "Scan to Pay")
            quickActionButtons(imageName: "gift-box", title: "ME2U- share Airtime")
            quickActionButtons(imageName: "user", title: "Refer & Earn")
            quickActionButtons(imageName: "discover", title: "Discover")
        })
        .padding()
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
}
