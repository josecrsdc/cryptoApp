//
//  CoinListView.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import SwiftUI

struct CoinListView: View {
    
    @ObservedObject var viewModel = CoinListVM()
    @State var showSearchBar: CGFloat = -60
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            if viewModel.coins.isEmpty && !viewModel.failCharge {
                self.progressView
                
            } else if viewModel.failCharge {
                self.failChargeView
                
            } else {
                if showSearchBar != -60 {
                    SearchBar(text: $searchText)
                        .animation(.easeInOut(duration: 0.5))
                        .padding(.top, showSearchBar)
                }
                
                ScrollView {
                    ForEach(viewModel.coins.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { coin in
                        CoinRowView(coin: coin)
                    }
                    .padding(.top)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(Styles.colorBackground))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(viewModel.name, displayMode: .inline)
        .navigationColor(background: Styles.colorHeader, title: Styles.colorOnHeader)
        .navigationBarItems(leading: self.orderListButton)
        .navigationBarItems(trailing: self.searchButton)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: self.$viewModel.showAlert) {
            return Alert(title: Text(self.viewModel.alertTitle),
                  message: Text(self.viewModel.alertMessage),
                         dismissButton: .default(Text("Aceptar"), action: {
            }))
        }
        .onReceive(viewModel.timer) { time in
            if !viewModel.failCharge {
                self.viewModel.getCoins()
            }
        }
        .onTapGesture {
            dismissKeyboard()
        }
    }
}

// MARK: - Private Properties

extension CoinListView {
    
    private var progressView: some View {
        VStack {
            Spacer()
            VStack (spacing: 20){
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(Styles.colorOnBackground)))
                    .scaleEffect(2)
                    .font(.system(size:8))
                    .foregroundColor(Color(Styles.colorOnBackground))
            }
            Spacer()
        }
    }
    
    private var failChargeView: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "ops")!)
                .resizable()
                .scaledToFit()
                .padding()
            self.reloadButton
            Spacer()
        }
    }
    
    private var reloadButton: some View {
        Button {
            viewModel.failCharge = false
        } label: {
            Text("Volver a intentar")
                .foregroundColor(Color.black.opacity(0.6))
                .fontWeight(Font.Weight.medium)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                .compositingGroup()
                .shadow(color: .black.opacity(0.3), radius: 3)
                .padding([.horizontal, .top])
        }
    }
    
    private var searchButton: some View {
        Button {
            withAnimation {
                showSearchBar = showSearchBar == -60 ? 30 : -60
            }
            dismissKeyboard()
        } label: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(Styles.colorOnHeader))
        }
    }
    
    private var orderListButton: some View {
        Button {
            viewModel.isListSorted.toggle()
            if !viewModel.isListSorted {
                self.viewModel.getCoins()
            } else {
                self.viewModel.sortList()
            }
        } label: {
            Image(systemName: viewModel.isListSorted ? "xmark" : "arrow.up.arrow.down")
                .foregroundColor(Color(Styles.colorOnHeader))
        }

    }

}


struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
