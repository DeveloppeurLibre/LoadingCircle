//
//  LoadingCircle.swift
//  LoadingCircle
//
//  Created by Quentin Cornu on 24/09/2021.
//

import SwiftUI

struct LoadingCircle: View {
	
	// MARK: - Private properties
	
	@State private var loadingHasBegan = false
	private let loadingColor: Color
	private let secondaryColor: Color
	
	// MARK: - Initializers
	
	init() {
		self.loadingColor = .blue
		self.secondaryColor = Color.gray.opacity(0.3)
	}
	
	private init(color: Color = .blue, secondaryColor: Color) {
		self.loadingColor = color
		self.secondaryColor = secondaryColor
	}
	
	// MARK: - Views
	
	var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: 4.0)
				.foregroundColor(secondaryColor)
			Circle()
				.trim(from: loadingHasBegan ? 0.0 : 0.2, to: 0.4)
				.stroke(lineWidth: 4.0)
				.animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
				.rotationEffect(.degrees(loadingHasBegan ? 0 : 360))
				.animation(.linear(duration: 1.6).repeatForever(autoreverses: false))
				.foregroundColor(loadingColor)
		}
		.frame(width: 28, height: 28)
		.onAppear {
			loadingHasBegan = true
		}
	}
	
	// MARK: - ViewModifiers
	
	func loadingColor(_ color: Color) -> LoadingCircle {
		return LoadingCircle(color: color, secondaryColor: self.secondaryColor)
	}
	
	func secondaryColor(_ color: Color) -> LoadingCircle {
		return LoadingCircle(color: self.loadingColor, secondaryColor: color)
	}
}

struct LoadingSwitch_Previews: PreviewProvider {
	
	static var previews: some View {
		LoadingCircle()
			.padding()
			.previewLayout(.sizeThatFits)
	}
}
