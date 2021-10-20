import SwiftUI

struct BonusesView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(Color("LighterBlue"))
                
                VStack(spacing: 16) {
                    Image("People")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 20)

                    Text("500 рублей тебе и другу")
                        .foregroundColor(Color("White"))
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text("Поделитесь вашей ссылкой с друзьями. Они получат по 500 рублей на первый заказ. А вы - скидку 500 рублей сразу после их уборки")
                        .foregroundColor(Color("White"))
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    ZStack {
                        RoundedRectangle(cornerRadius: 11.0)
                            .foregroundColor(Color("White"))

                        HStack {
                            Image("RightArrow")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)

                            Text("Поделиться")
                                .foregroundColor(Color("LighterBlue"))
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                        }
                    }
                    .frame(height: 60)

                    Spacer()
                }
                .padding()
            }
            .frame(height: 474)
            .padding()
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct BonusesView_Previews: PreviewProvider {
    static var previews: some View {
        BonusesView()
    }
}
