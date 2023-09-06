import SwiftUI
import MapKit

@available(iOS 14.0, *)
@available(tvOS 14.0, *)
@available(watchOS 6.0, *)
@available(OSX 10.15, *)

public struct MapManager: View {
    
    @ObservedObject  var manager = LocationManager()
    
    // ユーザートラッキングモードを追従モードにするための変数を定義
    @State  var trackingMode = MapUserTrackingMode.follow
    let spotList = [
        Spot(name: "1.circle.fill", latitude: 34.38283271919265, longitude: 132.44880007268657),
        Spot(name: "2.circle.fill", latitude: 34.383132658853114, longitude: 132.44879068495646),
        Spot(name: "3.circle.fill", latitude: 34.38382910132105, longitude: 132.45210053091606),
        Spot(name: "4.circle.fill", latitude: 34.39192446685563, longitude: 132.45564996073864)
    ]
    
    struct Spot: Identifiable {
        let id = UUID()
        let name: String
        let latitude: Double
        let longitude: Double
        var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    public init() {

    }
    public var body: some View {
        Map(coordinateRegion: $manager.region,
            showsUserLocation: true, // マップ上にユーザーの場所を表示するオプションをBool値で指定
            userTrackingMode: $trackingMode, // マップがユーザーの位置情報更新にどのように応答するかを決定
            annotationItems: spotList,
            annotationContent: { spot in
                MapAnnotation(coordinate: spot.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5),
                content: {
                    Image(systemName: spot.name).foregroundColor(.red)
                    .onTapGesture(count: 1, perform: {
                        //タップイベント
                        print( $manager.region.center.latitude )
                        print( $manager.region.center.longitude )
                    })
                    /*Text(spot.name).italic()*/
                })
            }
        ).edgesIgnoringSafeArea(.bottom)
    }
}
