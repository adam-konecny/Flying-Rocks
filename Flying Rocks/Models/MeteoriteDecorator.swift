//
//  MeteoriteDecorator.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 24.11.2024.
//

import Foundation
import Helpers
import MapKit

struct MeteoriteDecorator: Identifiable, Hashable {
    let id: String
    let name: String
    let mass: String
    let date: String
    let coordinate: CLLocationCoordinate2D
    let readableCoordinates: LocalizedStringResource
    
    var imageUrl: String {
        guard let lastCharacter = id.last, let lastNumber = Int(String(lastCharacter)) else {
            return "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/newscms/2019_12/2792971/190320-meteor-al-1143.jpg"
        }
        
        switch lastNumber {
        case 1: return "https://media.gettyimages.com/id/1400382484/video/asteroid-impact-on-earth-asteroid-comet-meteorite-glows-enters-the-earths-atmosphere-attack.jpg?s=640x640&k=20&c=9Lec3xoQ4sHdLH2LuHOw0AG5RQqigEVXheURvQpHk5g="
        case 2: return "https://media.istockphoto.com/id/533556135/photo/city-destroyed-by-meteor-shower.jpg?s=612x612&w=0&k=20&c=a8uYCVeiR1xnpEzEoMIQn83vfu9T_Ak-yRINBUgebb4="
        case 3: return "https://unescoalfozanprize.org/wp-content/uploads/2024/08/meteorite-falling-from-sky-seen-night-american-landscape-with-stars-shining-brightl-scaled.jpg"
        case 4: return "https://assets.iflscience.com/assets/articleNo/76855/aImg/80336/meteorite-falling-into-the-ocean-m.jpg"
        case 5: return "https://t3.ftcdn.net/jpg/05/85/47/56/360_F_585475657_crzJi2JpUhiOiL4zn2gvt5Y86AlShFnh.jpg"
        case 6: return "https://i.ytimg.com/vi/L-s_h5PS7VQ/maxresdefault.jpg"
        default: return "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/newscms/2019_12/2792971/190320-meteor-al-1143.jpg"
        }
                
    }
    
    init?(meteorite: Meteorite) {
        guard let mass = meteorite.mass else {
            return nil
        }
        
        guard let date = meteorite.date?.formatted(date: .long, time: .omitted) else {
            return nil
        }
        
        guard let location = meteorite.location else {
            return nil
        }
        
        self.id = meteorite.id
        self.name = meteorite.name
        self.mass = MeasurementFormatter.meteoriteWeight(fromGrams: mass)
        self.date = date
        
        let coordinate = CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude
        )
        
        self.coordinate = coordinate
        self.readableCoordinates = CoordinatesToDMS.readable(from: coordinate)
    }
    
    static func == (lhs: MeteoriteDecorator, rhs: MeteoriteDecorator) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(mass)
        hasher.combine(date)
    }
}

extension MeteoriteDecorator {
    static var mocked: MeteoriteDecorator {
        .init(meteorite: .mocked)!
    }
}
