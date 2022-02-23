import ComposableArchitecture

public struct InfoState: Equatable {
  public var author: String
  public var appDescription: String
  public var projectURL: URL
  
  public init(
    author: String = "Kody Deda",
    appDescription: String = "This app supports macOS, iOS, iPadOS, & watchOS! 🎉",
    projectURL: URL = URL(string: "https://github.com/kodydeda4/SwiftUI-GuitarTuner")!
  ) {
    self.author = author
    self.appDescription = appDescription
    self.projectURL = projectURL
  }
}

public enum InfoAction: Equatable {
  case onAppear
}

public let infoReducer = Reducer<InfoState, InfoAction, Void> { state, action, _ in
  switch action {
  case .onAppear:
    return .none
  }
}

