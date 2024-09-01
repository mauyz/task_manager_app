/// Enum representing the various states of an operation.
enum OperationStatus {
  /// The initial state, before any operation has started.
  initial,

  /// The state when the operation is in progress.
  submitting,

  /// The state when the operation has successfully completed.
  success,

  /// The state when the operation has failed.
  failure,
}
