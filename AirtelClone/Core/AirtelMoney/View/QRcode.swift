//
//  QRcode.swift
//  AirtelClone
//
//  Created by Muktar Aisak on 22/08/2024.
//

import SwiftUI

struct QRcode: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "xmark.circle")
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .onTapGesture {
                    dismiss()
                }
                .padding(.top, 16)
            
            Text("Your QR Code is:")
                .font(.headline)
            
            Image("qr")
                .resizable()
                .scaledToFit()
        }
        .padding(.horizontal)
    }
}

#Preview {
    QRcode()
}
