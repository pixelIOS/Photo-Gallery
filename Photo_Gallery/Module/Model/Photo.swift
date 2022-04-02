//
//  Photo.swift
//  Photo_Gallery
//
//  Created by Ahmad Mustafa on 02/04/2022.
//

import Foundation

// MARK: - PhotoElement
struct PhotoElement: Codable {
    let id: String?
    let createdAt, updatedAt: String?
//    let promotedAt: PromotedAt?
    let width, height: Int?
    let color, blurHash, photoDescription: String?
//    let altDescription: AltDescription?
    let urls: Urls?
    let links: PhotoLinks?
    let categories: [String]?
    let likes: Int?
    let likedByUser: Bool?
    let currentUserCollections: [String]?
//    let sponsorship: SponsorshipUnion?
    let topicSubmissions: TopicSubmissions?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case photoDescription = "description"
//        case altDescription = "alt_description"
        case urls, links,categories, likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
//        case sponsorship
        case topicSubmissions = "topic_submissions"
        case user
    }
}

enum AltDescription: String, Codable {
    case null = "null"
    case womanInTealDressWalkingOnWater = "woman in teal dress walking on water"
}

// MARK: - PhotoLinks
struct PhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

enum PromotedAt: Codable {
    case dateTime(Date)
    case enumeration(AltDescription)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Date.self) {
            self = .dateTime(x)
            return
        }
        if let x = try? container.decode(AltDescription.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(PromotedAt.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PromotedAt"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .dateTime(let x):
            try container.encode(x)
        case .enumeration(let x):
            try container.encode(x)
        }
    }
}

enum SponsorshipUnion: Codable {
    case enumeration(AltDescription)
    case sponsorshipClass(SponsorshipClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(AltDescription.self) {
            self = .enumeration(x)
            return
        }
        if let x = try? container.decode(SponsorshipClass.self) {
            self = .sponsorshipClass(x)
            return
        }
        throw DecodingError.typeMismatch(SponsorshipUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SponsorshipUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .sponsorshipClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - SponsorshipClass
struct SponsorshipClass: Codable {
    let impressionUrls: [String]?
    let tagline: String?
    let taglineURL: String?
    let sponsor: User?

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - User
struct User: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
    let paypalEmail: AltDescription?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissions: Codable {
    let nature, wallpapers, actForNature, colorOfWater: ActForNature?
    let fashion: Fashion?

    enum CodingKeys: String, CodingKey {
        case nature, wallpapers
        case actForNature = "act-for-nature"
        case colorOfWater = "color-of-water"
        case fashion
    }
}

// MARK: - ActForNature
struct ActForNature: Codable {
    let status: String?
}

// MARK: - Fashion
struct Fashion: Codable {
    let status: String?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

typealias Photo = [PhotoElement]
