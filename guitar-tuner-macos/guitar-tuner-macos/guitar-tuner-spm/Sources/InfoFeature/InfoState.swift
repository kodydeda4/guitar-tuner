import ComposableArchitecture

public struct InfoState: Equatable {
  public let author: String
  
  public init(author: String = "Kody Deda") {
    self.author = author
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

