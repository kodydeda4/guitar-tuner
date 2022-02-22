import ComposableArchitecture

public struct AboutState: Equatable {
  public let author: String
  
  public init(author: String = "Kody Deda") {
    self.author = author
  }
}

public enum AboutAction: Equatable {
  
}

public let aboutReducer = Reducer<AboutState, AboutAction, Void> { state, action, _ in
  switch action {
    
  }
}

