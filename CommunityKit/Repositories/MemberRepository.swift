//
//  MemberRepository.swift
//  CommunityKit
//
//  Created by Andrii Selivanov on 3/29/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import RealmSwift

class MemberModel : Object {
    @objc dynamic var id : String = ""
    @objc dynamic var emailAddress : String = ""
    @objc dynamic var admin : Bool = false
    @objc dynamic var profilePicture : String?
    @objc dynamic var firstName : String = ""
    @objc dynamic var lastName : String = ""
    @objc dynamic var username : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }

}

public class MemberRepository: MemberRepositoryProtocol {
    
    private let db : Realm
    
    public init(db: Realm) {
        self.db = db
    }
    
    public func persist(member: Member) throws {

        let mm = MemberModel()
        
        mm.id = String(describing: member.id)
        mm.emailAddress = String(describing: member.emailAddress)
        mm.admin = member.isAdmin
        mm.username = String(describing: member.username)
        mm.firstName = member.properName.firstName
        mm.lastName = member.properName.lastName
        if let picture = member.profilePicture {
            mm.profilePicture = picture.pictureDataString
        }
        
        try self.db.write {
            self.db.add(mm, update: true)
        }

    }
    
    public func get(id: UUIDV4) throws -> Member? {

        let fetchedMember = self.db.objects(MemberModel.self).filter("id = %@", String(describing: id)).first

        guard let member = fetchedMember else {
            return nil
        }
        
        // create profile picture
        let profilePicture : ProfilePicture?
        switch member.profilePicture {
        case nil:
            profilePicture = nil
            break
        default:
            profilePicture = try ProfilePicture(member.profilePicture!)
        }

        let m = Member(
            id: try UUIDV4(member.id),
            properName: try ProperName(firstName: member.firstName, lastName: member.lastName),
            username: try Username(member.username),
            profilePicture: profilePicture,
            emailAddress: try EmailAddress(member.emailAddress),
            isAdmin: member.admin
        )
        
        return m
        
    }
    
}
