//  This file was automatically generated and should not be edited.

import Apollo

public enum ApplicationState: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case rejected
  case approved
  case pending
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Rejected": self = .rejected
      case "Approved": self = .approved
      case "Pending": self = .pending
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .rejected: return "Rejected"
      case .approved: return "Approved"
      case .pending: return "Pending"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ApplicationState, rhs: ApplicationState) -> Bool {
    switch (lhs, rhs) {
      case (.rejected, .rejected): return true
      case (.approved, .approved): return true
      case (.pending, .pending): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum RejectApplicationError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case unauthenticated
  case insufficientPermissions
  case applicationDoesNotExist
  case alreadyReviewed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Unauthenticated": self = .unauthenticated
      case "InsufficientPermissions": self = .insufficientPermissions
      case "ApplicationDoesNotExist": self = .applicationDoesNotExist
      case "AlreadyReviewed": self = .alreadyReviewed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .unauthenticated: return "Unauthenticated"
      case .insufficientPermissions: return "InsufficientPermissions"
      case .applicationDoesNotExist: return "ApplicationDoesNotExist"
      case .alreadyReviewed: return "AlreadyReviewed"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RejectApplicationError, rhs: RejectApplicationError) -> Bool {
    switch (lhs, rhs) {
      case (.unauthenticated, .unauthenticated): return true
      case (.insufficientPermissions, .insufficientPermissions): return true
      case (.applicationDoesNotExist, .applicationDoesNotExist): return true
      case (.alreadyReviewed, .alreadyReviewed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum ApproveApplicationError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case unauthenticated
  case insufficientPermissions
  case applicationDoesNotExist
  case alreadyReviewed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Unauthenticated": self = .unauthenticated
      case "InsufficientPermissions": self = .insufficientPermissions
      case "ApplicationDoesNotExist": self = .applicationDoesNotExist
      case "AlreadyReviewed": self = .alreadyReviewed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .unauthenticated: return "Unauthenticated"
      case .insufficientPermissions: return "InsufficientPermissions"
      case .applicationDoesNotExist: return "ApplicationDoesNotExist"
      case .alreadyReviewed: return "AlreadyReviewed"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ApproveApplicationError, rhs: ApproveApplicationError) -> Bool {
    switch (lhs, rhs) {
      case (.unauthenticated, .unauthenticated): return true
      case (.insufficientPermissions, .insufficientPermissions): return true
      case (.applicationDoesNotExist, .applicationDoesNotExist): return true
      case (.alreadyReviewed, .alreadyReviewed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum ApplicationsResponseError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case unauthenticated
  case insufficientPermissions
  case applicationNotFound
  case notAllowedToAccessApplication
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Unauthenticated": self = .unauthenticated
      case "InsufficientPermissions": self = .insufficientPermissions
      case "ApplicationNotFound": self = .applicationNotFound
      case "NotAllowedToAccessApplication": self = .notAllowedToAccessApplication
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .unauthenticated: return "Unauthenticated"
      case .insufficientPermissions: return "InsufficientPermissions"
      case .applicationNotFound: return "ApplicationNotFound"
      case .notAllowedToAccessApplication: return "NotAllowedToAccessApplication"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ApplicationsResponseError, rhs: ApplicationsResponseError) -> Bool {
    switch (lhs, rhs) {
      case (.unauthenticated, .unauthenticated): return true
      case (.insufficientPermissions, .insufficientPermissions): return true
      case (.applicationNotFound, .applicationNotFound): return true
      case (.notAllowedToAccessApplication, .notAllowedToAccessApplication): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum ApplyForVerificationError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case pendingApplication
  case alreadyVerified
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PendingApplication": self = .pendingApplication
      case "AlreadyVerified": self = .alreadyVerified
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .pendingApplication: return "PendingApplication"
      case .alreadyVerified: return "AlreadyVerified"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ApplyForVerificationError, rhs: ApplyForVerificationError) -> Bool {
    switch (lhs, rhs) {
      case (.pendingApplication, .pendingApplication): return true
      case (.alreadyVerified, .alreadyVerified): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct LoginInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(emailAddress: String, memberAccessPublicKey: String, confirmationCode: String) {
    graphQLMap = ["emailAddress": emailAddress, "memberAccessPublicKey": memberAccessPublicKey, "confirmationCode": confirmationCode]
  }

  public var emailAddress: String {
    get {
      return graphQLMap["emailAddress"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "emailAddress")
    }
  }

  public var memberAccessPublicKey: String {
    get {
      return graphQLMap["memberAccessPublicKey"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "memberAccessPublicKey")
    }
  }

  public var confirmationCode: String {
    get {
      return graphQLMap["confirmationCode"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "confirmationCode")
    }
  }
}

public enum LoginError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case confirmationCodeNotFound
  case confirmationCodeExpired
  case confirmationCodeAlreadyUsed
  case memberAccessKeyHasAlreadyBeenUsed
  case confirmationCodeMemberMismatch
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ConfirmationCodeNotFound": self = .confirmationCodeNotFound
      case "ConfirmationCodeExpired": self = .confirmationCodeExpired
      case "ConfirmationCodeAlreadyUsed": self = .confirmationCodeAlreadyUsed
      case "MemberAccessKeyHasAlreadyBeenUsed": self = .memberAccessKeyHasAlreadyBeenUsed
      case "ConfirmationCodeMemberMismatch": self = .confirmationCodeMemberMismatch
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .confirmationCodeNotFound: return "ConfirmationCodeNotFound"
      case .confirmationCodeExpired: return "ConfirmationCodeExpired"
      case .confirmationCodeAlreadyUsed: return "ConfirmationCodeAlreadyUsed"
      case .memberAccessKeyHasAlreadyBeenUsed: return "MemberAccessKeyHasAlreadyBeenUsed"
      case .confirmationCodeMemberMismatch: return "ConfirmationCodeMemberMismatch"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LoginError, rhs: LoginError) -> Bool {
    switch (lhs, rhs) {
      case (.confirmationCodeNotFound, .confirmationCodeNotFound): return true
      case (.confirmationCodeExpired, .confirmationCodeExpired): return true
      case (.confirmationCodeAlreadyUsed, .confirmationCodeAlreadyUsed): return true
      case (.memberAccessKeyHasAlreadyBeenUsed, .memberAccessKeyHasAlreadyBeenUsed): return true
      case (.confirmationCodeMemberMismatch, .confirmationCodeMemberMismatch): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct SignUpInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(username: String, emailAddress: String, properName: ProperNameInput, profilePicture: Swift.Optional<String?> = nil) {
    graphQLMap = ["username": username, "emailAddress": emailAddress, "properName": properName, "profilePicture": profilePicture]
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var emailAddress: String {
    get {
      return graphQLMap["emailAddress"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "emailAddress")
    }
  }

  public var properName: ProperNameInput {
    get {
      return graphQLMap["properName"] as! ProperNameInput
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "properName")
    }
  }

  public var profilePicture: Swift.Optional<String?> {
    get {
      return graphQLMap["profilePicture"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profilePicture")
    }
  }
}

public struct ProperNameInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(firstName: String, lastName: String) {
    graphQLMap = ["firstName": firstName, "lastName": lastName]
  }

  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }
}

public enum SignUpError: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case usernameTaken
  case emailAddressTaken
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "UsernameTaken": self = .usernameTaken
      case "EmailAddressTaken": self = .emailAddressTaken
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .usernameTaken: return "UsernameTaken"
      case .emailAddressTaken: return "EmailAddressTaken"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SignUpError, rhs: SignUpError) -> Bool {
    switch (lhs, rhs) {
      case (.usernameTaken, .usernameTaken): return true
      case (.emailAddressTaken, .emailAddressTaken): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class RejectApplicationMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation RejectApplication($id: UUIDV4!, $reason: String!) {\n  rejectApplication(input: {applicationID: $id, rejectionReason: $reason}) {\n    __typename\n    application {\n      __typename\n      member {\n        __typename\n        id\n      }\n      id\n      applicationText\n      state\n      createdAt\n      rejectionReason\n      rejectedAt\n      approvedAt\n    }\n    error\n  }\n}"

  public var id: String
  public var reason: String

  public init(id: String, reason: String) {
    self.id = id
    self.reason = reason
  }

  public var variables: GraphQLMap? {
    return ["id": id, "reason": reason]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("rejectApplication", arguments: ["input": ["applicationID": GraphQLVariable("id"), "rejectionReason": GraphQLVariable("reason")]], type: .nonNull(.object(RejectApplication.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rejectApplication: RejectApplication) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "rejectApplication": rejectApplication.resultMap])
    }

    public var rejectApplication: RejectApplication {
      get {
        return RejectApplication(unsafeResultMap: resultMap["rejectApplication"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "rejectApplication")
      }
    }

    public struct RejectApplication: GraphQLSelectionSet {
      public static let possibleTypes = ["RejectApplicationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("application", type: .object(Application.selections)),
        GraphQLField("error", type: .scalar(RejectApplicationError.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(application: Application? = nil, error: RejectApplicationError? = nil) {
        self.init(unsafeResultMap: ["__typename": "RejectApplicationResponse", "application": application.flatMap { (value: Application) -> ResultMap in value.resultMap }, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var application: Application? {
        get {
          return (resultMap["application"] as? ResultMap).flatMap { Application(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "application")
        }
      }

      public var error: RejectApplicationError? {
        get {
          return resultMap["error"] as? RejectApplicationError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public struct Application: GraphQLSelectionSet {
        public static let possibleTypes = ["Application"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("member", type: .nonNull(.object(Member.selections))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("applicationText", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(ApplicationState.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("rejectionReason", type: .scalar(String.self)),
          GraphQLField("rejectedAt", type: .scalar(String.self)),
          GraphQLField("approvedAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(member: Member, id: String, applicationText: String, state: ApplicationState, createdAt: String, rejectionReason: String? = nil, rejectedAt: String? = nil, approvedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Application", "member": member.resultMap, "id": id, "applicationText": applicationText, "state": state, "createdAt": createdAt, "rejectionReason": rejectionReason, "rejectedAt": rejectedAt, "approvedAt": approvedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var member: Member {
          get {
            return Member(unsafeResultMap: resultMap["member"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "member")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var applicationText: String {
          get {
            return resultMap["applicationText"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "applicationText")
          }
        }

        public var state: ApplicationState {
          get {
            return resultMap["state"]! as! ApplicationState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var rejectionReason: String? {
          get {
            return resultMap["rejectionReason"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectionReason")
          }
        }

        public var rejectedAt: String? {
          get {
            return resultMap["rejectedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectedAt")
          }
        }

        public var approvedAt: String? {
          get {
            return resultMap["approvedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "approvedAt")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["Member"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "Member", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class ApproveApplicationMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation ApproveApplication($id: UUIDV4!) {\n  approveApplication(applicationID: $id) {\n    __typename\n    application {\n      __typename\n      member {\n        __typename\n        id\n      }\n      id\n      applicationText\n      state\n      createdAt\n      rejectionReason\n      rejectedAt\n      approvedAt\n    }\n    error\n  }\n}"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("approveApplication", arguments: ["applicationID": GraphQLVariable("id")], type: .nonNull(.object(ApproveApplication.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(approveApplication: ApproveApplication) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "approveApplication": approveApplication.resultMap])
    }

    public var approveApplication: ApproveApplication {
      get {
        return ApproveApplication(unsafeResultMap: resultMap["approveApplication"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "approveApplication")
      }
    }

    public struct ApproveApplication: GraphQLSelectionSet {
      public static let possibleTypes = ["ApproveApplicationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("application", type: .object(Application.selections)),
        GraphQLField("error", type: .scalar(ApproveApplicationError.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(application: Application? = nil, error: ApproveApplicationError? = nil) {
        self.init(unsafeResultMap: ["__typename": "ApproveApplicationResponse", "application": application.flatMap { (value: Application) -> ResultMap in value.resultMap }, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var application: Application? {
        get {
          return (resultMap["application"] as? ResultMap).flatMap { Application(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "application")
        }
      }

      public var error: ApproveApplicationError? {
        get {
          return resultMap["error"] as? ApproveApplicationError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public struct Application: GraphQLSelectionSet {
        public static let possibleTypes = ["Application"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("member", type: .nonNull(.object(Member.selections))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("applicationText", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(ApplicationState.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("rejectionReason", type: .scalar(String.self)),
          GraphQLField("rejectedAt", type: .scalar(String.self)),
          GraphQLField("approvedAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(member: Member, id: String, applicationText: String, state: ApplicationState, createdAt: String, rejectionReason: String? = nil, rejectedAt: String? = nil, approvedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Application", "member": member.resultMap, "id": id, "applicationText": applicationText, "state": state, "createdAt": createdAt, "rejectionReason": rejectionReason, "rejectedAt": rejectedAt, "approvedAt": approvedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var member: Member {
          get {
            return Member(unsafeResultMap: resultMap["member"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "member")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var applicationText: String {
          get {
            return resultMap["applicationText"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "applicationText")
          }
        }

        public var state: ApplicationState {
          get {
            return resultMap["state"]! as! ApplicationState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var rejectionReason: String? {
          get {
            return resultMap["rejectionReason"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectionReason")
          }
        }

        public var rejectedAt: String? {
          get {
            return resultMap["rejectedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectedAt")
          }
        }

        public var approvedAt: String? {
          get {
            return resultMap["approvedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "approvedAt")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["Member"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "Member", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class ApplicationsQuery: GraphQLQuery {
  public let operationDefinition =
    "query Applications($fromId: UUIDV4, $count: Int!, $state: ApplicationState!) {\n  applications(position: $fromId, next: $count, state: $state) {\n    __typename\n    error\n    applications {\n      __typename\n      member {\n        __typename\n        id\n        name {\n          __typename\n          firstName\n          lastName\n        }\n        username\n        profilePicture\n        admin\n        emailAddress\n      }\n      id\n      applicationText\n      state\n      createdAt\n      rejectionReason\n      rejectedAt\n      approvedAt\n    }\n  }\n}"

  public var fromId: String?
  public var count: Int
  public var state: ApplicationState

  public init(fromId: String? = nil, count: Int, state: ApplicationState) {
    self.fromId = fromId
    self.count = count
    self.state = state
  }

  public var variables: GraphQLMap? {
    return ["fromId": fromId, "count": count, "state": state]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("applications", arguments: ["position": GraphQLVariable("fromId"), "next": GraphQLVariable("count"), "state": GraphQLVariable("state")], type: .nonNull(.object(Application.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(applications: Application) {
      self.init(unsafeResultMap: ["__typename": "Query", "applications": applications.resultMap])
    }

    public var applications: Application {
      get {
        return Application(unsafeResultMap: resultMap["applications"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "applications")
      }
    }

    public struct Application: GraphQLSelectionSet {
      public static let possibleTypes = ["ApplicationsResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("error", type: .scalar(ApplicationsResponseError.self)),
        GraphQLField("applications", type: .nonNull(.list(.nonNull(.object(Application.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(error: ApplicationsResponseError? = nil, applications: [Application]) {
        self.init(unsafeResultMap: ["__typename": "ApplicationsResponse", "error": error, "applications": applications.map { (value: Application) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var error: ApplicationsResponseError? {
        get {
          return resultMap["error"] as? ApplicationsResponseError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var applications: [Application] {
        get {
          return (resultMap["applications"] as! [ResultMap]).map { (value: ResultMap) -> Application in Application(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Application) -> ResultMap in value.resultMap }, forKey: "applications")
        }
      }

      public struct Application: GraphQLSelectionSet {
        public static let possibleTypes = ["Application"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("member", type: .nonNull(.object(Member.selections))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("applicationText", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(ApplicationState.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("rejectionReason", type: .scalar(String.self)),
          GraphQLField("rejectedAt", type: .scalar(String.self)),
          GraphQLField("approvedAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(member: Member, id: String, applicationText: String, state: ApplicationState, createdAt: String, rejectionReason: String? = nil, rejectedAt: String? = nil, approvedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Application", "member": member.resultMap, "id": id, "applicationText": applicationText, "state": state, "createdAt": createdAt, "rejectionReason": rejectionReason, "rejectedAt": rejectedAt, "approvedAt": approvedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var member: Member {
          get {
            return Member(unsafeResultMap: resultMap["member"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "member")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var applicationText: String {
          get {
            return resultMap["applicationText"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "applicationText")
          }
        }

        public var state: ApplicationState {
          get {
            return resultMap["state"]! as! ApplicationState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var rejectionReason: String? {
          get {
            return resultMap["rejectionReason"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectionReason")
          }
        }

        public var rejectedAt: String? {
          get {
            return resultMap["rejectedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectedAt")
          }
        }

        public var approvedAt: String? {
          get {
            return resultMap["approvedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "approvedAt")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["Member"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.object(Name.selections))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("profilePicture", type: .scalar(String.self)),
            GraphQLField("admin", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("emailAddress", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: Name, username: String, profilePicture: String? = nil, admin: Bool, emailAddress: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Member", "id": id, "name": name.resultMap, "username": username, "profilePicture": profilePicture, "admin": admin, "emailAddress": emailAddress])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: Name {
            get {
              return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "name")
            }
          }

          public var username: String {
            get {
              return resultMap["username"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }

          public var profilePicture: String? {
            get {
              return resultMap["profilePicture"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profilePicture")
            }
          }

          public var admin: Bool {
            get {
              return resultMap["admin"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "admin")
            }
          }

          public var emailAddress: String? {
            get {
              return resultMap["emailAddress"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "emailAddress")
            }
          }

          public struct Name: GraphQLSelectionSet {
            public static let possibleTypes = ["ProperName"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(firstName: String, lastName: String) {
              self.init(unsafeResultMap: ["__typename": "ProperName", "firstName": firstName, "lastName": lastName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var firstName: String {
              get {
                return resultMap["firstName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String {
              get {
                return resultMap["lastName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }
          }
        }
      }
    }
  }
}

public final class CurrentMemberQuery: GraphQLQuery {
  public let operationDefinition =
    "query CurrentMember {\n  myMember {\n    __typename\n    id\n    name {\n      __typename\n      firstName\n      lastName\n    }\n    username\n    profilePicture\n    admin\n    emailAddress\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("myMember", type: .object(MyMember.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(myMember: MyMember? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "myMember": myMember.flatMap { (value: MyMember) -> ResultMap in value.resultMap }])
    }

    /// does this even exist - the profile? What is the Profile
    public var myMember: MyMember? {
      get {
        return (resultMap["myMember"] as? ResultMap).flatMap { MyMember(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "myMember")
      }
    }

    public struct MyMember: GraphQLSelectionSet {
      public static let possibleTypes = ["Member"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("profilePicture", type: .scalar(String.self)),
        GraphQLField("admin", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("emailAddress", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, name: Name, username: String, profilePicture: String? = nil, admin: Bool, emailAddress: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Member", "id": id, "name": name.resultMap, "username": username, "profilePicture": profilePicture, "admin": admin, "emailAddress": emailAddress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var profilePicture: String? {
        get {
          return resultMap["profilePicture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePicture")
        }
      }

      public var admin: Bool {
        get {
          return resultMap["admin"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "admin")
        }
      }

      public var emailAddress: String? {
        get {
          return resultMap["emailAddress"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "emailAddress")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["ProperName"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(firstName: String, lastName: String) {
          self.init(unsafeResultMap: ["__typename": "ProperName", "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }
      }
    }
  }
}

public final class ApplyForVerificationMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation ApplyForVerification($applicationText: String!) {\n  applyForVerification(applicationText: $applicationText) {\n    __typename\n    application {\n      __typename\n      member {\n        __typename\n        id\n      }\n      id\n      applicationText\n      state\n      createdAt\n      rejectionReason\n      rejectedAt\n      approvedAt\n    }\n    error\n  }\n}"

  public var applicationText: String

  public init(applicationText: String) {
    self.applicationText = applicationText
  }

  public var variables: GraphQLMap? {
    return ["applicationText": applicationText]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("applyForVerification", arguments: ["applicationText": GraphQLVariable("applicationText")], type: .nonNull(.object(ApplyForVerification.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(applyForVerification: ApplyForVerification) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "applyForVerification": applyForVerification.resultMap])
    }

    public var applyForVerification: ApplyForVerification {
      get {
        return ApplyForVerification(unsafeResultMap: resultMap["applyForVerification"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "applyForVerification")
      }
    }

    public struct ApplyForVerification: GraphQLSelectionSet {
      public static let possibleTypes = ["ApplyForVerificationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("application", type: .object(Application.selections)),
        GraphQLField("error", type: .scalar(ApplyForVerificationError.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(application: Application? = nil, error: ApplyForVerificationError? = nil) {
        self.init(unsafeResultMap: ["__typename": "ApplyForVerificationResponse", "application": application.flatMap { (value: Application) -> ResultMap in value.resultMap }, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var application: Application? {
        get {
          return (resultMap["application"] as? ResultMap).flatMap { Application(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "application")
        }
      }

      public var error: ApplyForVerificationError? {
        get {
          return resultMap["error"] as? ApplyForVerificationError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public struct Application: GraphQLSelectionSet {
        public static let possibleTypes = ["Application"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("member", type: .nonNull(.object(Member.selections))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("applicationText", type: .nonNull(.scalar(String.self))),
          GraphQLField("state", type: .nonNull(.scalar(ApplicationState.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("rejectionReason", type: .scalar(String.self)),
          GraphQLField("rejectedAt", type: .scalar(String.self)),
          GraphQLField("approvedAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(member: Member, id: String, applicationText: String, state: ApplicationState, createdAt: String, rejectionReason: String? = nil, rejectedAt: String? = nil, approvedAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Application", "member": member.resultMap, "id": id, "applicationText": applicationText, "state": state, "createdAt": createdAt, "rejectionReason": rejectionReason, "rejectedAt": rejectedAt, "approvedAt": approvedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var member: Member {
          get {
            return Member(unsafeResultMap: resultMap["member"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "member")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var applicationText: String {
          get {
            return resultMap["applicationText"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "applicationText")
          }
        }

        public var state: ApplicationState {
          get {
            return resultMap["state"]! as! ApplicationState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var rejectionReason: String? {
          get {
            return resultMap["rejectionReason"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectionReason")
          }
        }

        public var rejectedAt: String? {
          get {
            return resultMap["rejectedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rejectedAt")
          }
        }

        public var approvedAt: String? {
          get {
            return resultMap["approvedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "approvedAt")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["Member"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "Member", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class MyCurrentApplicationQuery: GraphQLQuery {
  public let operationDefinition =
    "query MyCurrentApplication {\n  myCurrentApplication {\n    __typename\n    member {\n      __typename\n      id\n    }\n    id\n    applicationText\n    state\n    createdAt\n    rejectionReason\n    rejectedAt\n    approvedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("myCurrentApplication", type: .object(MyCurrentApplication.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(myCurrentApplication: MyCurrentApplication? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "myCurrentApplication": myCurrentApplication.flatMap { (value: MyCurrentApplication) -> ResultMap in value.resultMap }])
    }

    public var myCurrentApplication: MyCurrentApplication? {
      get {
        return (resultMap["myCurrentApplication"] as? ResultMap).flatMap { MyCurrentApplication(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "myCurrentApplication")
      }
    }

    public struct MyCurrentApplication: GraphQLSelectionSet {
      public static let possibleTypes = ["Application"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("member", type: .nonNull(.object(Member.selections))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("applicationText", type: .nonNull(.scalar(String.self))),
        GraphQLField("state", type: .nonNull(.scalar(ApplicationState.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("rejectionReason", type: .scalar(String.self)),
        GraphQLField("rejectedAt", type: .scalar(String.self)),
        GraphQLField("approvedAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(member: Member, id: String, applicationText: String, state: ApplicationState, createdAt: String, rejectionReason: String? = nil, rejectedAt: String? = nil, approvedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Application", "member": member.resultMap, "id": id, "applicationText": applicationText, "state": state, "createdAt": createdAt, "rejectionReason": rejectionReason, "rejectedAt": rejectedAt, "approvedAt": approvedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var member: Member {
        get {
          return Member(unsafeResultMap: resultMap["member"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "member")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var applicationText: String {
        get {
          return resultMap["applicationText"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "applicationText")
        }
      }

      public var state: ApplicationState {
        get {
          return resultMap["state"]! as! ApplicationState
        }
        set {
          resultMap.updateValue(newValue, forKey: "state")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var rejectionReason: String? {
        get {
          return resultMap["rejectionReason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "rejectionReason")
        }
      }

      public var rejectedAt: String? {
        get {
          return resultMap["rejectedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "rejectedAt")
        }
      }

      public var approvedAt: String? {
        get {
          return resultMap["approvedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "approvedAt")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["Member"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String) {
          self.init(unsafeResultMap: ["__typename": "Member", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Login($input: LoginInput!) {\n  login(input: $input) {\n    __typename\n    accessToken\n    error\n    member {\n      __typename\n      id\n      username\n      emailAddress\n      name {\n        __typename\n        firstName\n        lastName\n      }\n      profilePicture\n      admin\n    }\n  }\n}"

  public var input: LoginInput

  public init(input: LoginInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["LoginResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("accessToken", type: .scalar(String.self)),
        GraphQLField("error", type: .scalar(LoginError.self)),
        GraphQLField("member", type: .object(Member.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String? = nil, error: LoginError? = nil, member: Member? = nil) {
        self.init(unsafeResultMap: ["__typename": "LoginResponse", "accessToken": accessToken, "error": error, "member": member.flatMap { (value: Member) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var accessToken: String? {
        get {
          return resultMap["accessToken"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }

      public var error: LoginError? {
        get {
          return resultMap["error"] as? LoginError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var member: Member? {
        get {
          return (resultMap["member"] as? ResultMap).flatMap { Member(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "member")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["Member"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("emailAddress", type: .scalar(String.self)),
          GraphQLField("name", type: .nonNull(.object(Name.selections))),
          GraphQLField("profilePicture", type: .scalar(String.self)),
          GraphQLField("admin", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, username: String, emailAddress: String? = nil, name: Name, profilePicture: String? = nil, admin: Bool) {
          self.init(unsafeResultMap: ["__typename": "Member", "id": id, "username": username, "emailAddress": emailAddress, "name": name.resultMap, "profilePicture": profilePicture, "admin": admin])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var emailAddress: String? {
          get {
            return resultMap["emailAddress"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "emailAddress")
          }
        }

        public var name: Name {
          get {
            return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "name")
          }
        }

        public var profilePicture: String? {
          get {
            return resultMap["profilePicture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePicture")
          }
        }

        public var admin: Bool {
          get {
            return resultMap["admin"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "admin")
          }
        }

        public struct Name: GraphQLSelectionSet {
          public static let possibleTypes = ["ProperName"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(firstName: String, lastName: String) {
            self.init(unsafeResultMap: ["__typename": "ProperName", "firstName": firstName, "lastName": lastName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }
        }
      }
    }
  }
}

public final class RequestLoginMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation RequestLogin($emailAddress: EmailAddress!) {\n  requestLogin(emailAddress: $emailAddress)\n}"

  public var emailAddress: String

  public init(emailAddress: String) {
    self.emailAddress = emailAddress
  }

  public var variables: GraphQLMap? {
    return ["emailAddress": emailAddress]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("requestLogin", arguments: ["emailAddress": GraphQLVariable("emailAddress")], type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(requestLogin: Int) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "requestLogin": requestLogin])
    }

    public var requestLogin: Int {
      get {
        return resultMap["requestLogin"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "requestLogin")
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation SignUp($input: SignUpInput!) {\n  signUp(input: $input) {\n    __typename\n    member {\n      __typename\n      id\n      username\n      emailAddress\n      name {\n        __typename\n        firstName\n        lastName\n      }\n      profilePicture\n      admin\n    }\n    error\n  }\n}"

  public var input: SignUpInput

  public init(input: SignUpInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("signUp", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(SignUp.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signUp: SignUp) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signUp": signUp.resultMap])
    }

    public var signUp: SignUp {
      get {
        return SignUp(unsafeResultMap: resultMap["signUp"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signUp")
      }
    }

    public struct SignUp: GraphQLSelectionSet {
      public static let possibleTypes = ["SignUpResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("member", type: .object(Member.selections)),
        GraphQLField("error", type: .scalar(SignUpError.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(member: Member? = nil, error: SignUpError? = nil) {
        self.init(unsafeResultMap: ["__typename": "SignUpResponse", "member": member.flatMap { (value: Member) -> ResultMap in value.resultMap }, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var member: Member? {
        get {
          return (resultMap["member"] as? ResultMap).flatMap { Member(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "member")
        }
      }

      public var error: SignUpError? {
        get {
          return resultMap["error"] as? SignUpError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["Member"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("emailAddress", type: .scalar(String.self)),
          GraphQLField("name", type: .nonNull(.object(Name.selections))),
          GraphQLField("profilePicture", type: .scalar(String.self)),
          GraphQLField("admin", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, username: String, emailAddress: String? = nil, name: Name, profilePicture: String? = nil, admin: Bool) {
          self.init(unsafeResultMap: ["__typename": "Member", "id": id, "username": username, "emailAddress": emailAddress, "name": name.resultMap, "profilePicture": profilePicture, "admin": admin])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var emailAddress: String? {
          get {
            return resultMap["emailAddress"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "emailAddress")
          }
        }

        public var name: Name {
          get {
            return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "name")
          }
        }

        public var profilePicture: String? {
          get {
            return resultMap["profilePicture"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePicture")
          }
        }

        public var admin: Bool {
          get {
            return resultMap["admin"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "admin")
          }
        }

        public struct Name: GraphQLSelectionSet {
          public static let possibleTypes = ["ProperName"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(firstName: String, lastName: String) {
            self.init(unsafeResultMap: ["__typename": "ProperName", "firstName": firstName, "lastName": lastName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }
        }
      }
    }
  }
}