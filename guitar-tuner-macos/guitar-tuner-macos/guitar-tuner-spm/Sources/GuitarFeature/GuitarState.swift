import Models
import ComposableArchitecture
import GuitarClient

public struct GuitarState: Equatable {
  @BindableState public var tuning: GuitarTuning
  
  public init(
    tuning: GuitarTuning = .eStandard
  ) {
    self.tuning = tuning
  }
}

public enum GuitarAction: BindableAction, Equatable {
  case binding(BindingAction<GuitarState>)
  case play(Note)
}

public struct GuitarEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  public let guitarClient: GuitarClient
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    guitarClient: GuitarClient
  ) {
    self.mainQueue = mainQueue
    self.guitarClient = guitarClient
  }
}

public let guitarReducer = Reducer<
  GuitarState,
  GuitarAction,
  GuitarEnvironment
> { state, action, environment in
  
  switch action {
    
  case .binding:
    return .none
    
  case let .play(note):
    return environment
      .guitarClient
      .play(note)
      .fireAndForget()
  }
}
.binding()
