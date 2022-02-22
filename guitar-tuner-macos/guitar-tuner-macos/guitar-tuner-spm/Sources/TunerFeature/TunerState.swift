import Models
import ComposableArchitecture
import TunerClient

public struct TunerState: Equatable {
  @BindableState public var instrument: Instrument
  @BindableState public var tuning: InstrumentTuning
  var notes: [Note] { instrument == .bass ? Array(tuning.notes.prefix(upTo: 4)) : tuning.notes }
  
  public init(
    instrument: Instrument,
    tuning: InstrumentTuning
  ) {
    self.instrument = instrument
    self.tuning = tuning
  }
}

public enum TunerAction: BindableAction, Equatable {
  case binding(BindingAction<TunerState>)
  case play(Note)
}

public struct TunerEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  public let tunerClient: TunerClient
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    tunerClient: TunerClient
  ) {
    self.mainQueue = mainQueue
    self.tunerClient = tunerClient
  }
}

public let tunerReducer = Reducer<
  TunerState,
  TunerAction,
  TunerEnvironment
> { state, action, environment in
  
  switch action {
    
  case .binding:
    return .none
    
  case let .play(note):
    return environment
      .tunerClient
      .play(note)
      .fireAndForget()
  }
}
.binding()
