//
//  MapModels.swift
//  LoggingApp
//
//  Created by 金子光 on 2023/08/29.
//

import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    // 追加 地図を表示するための領域を保持
    // 更新のたびに変化するので@Publishedを付与して観測
    @Published  var region =  MKCoordinateRegion()

    override init() {
        super.init() // スーパクラスのイニシャライザを実行
        manager.delegate = self // 自身をデリゲートプロパティに設定
        manager.requestWhenInUseAuthorization() // 位置情報を利用許可をリクエスト
        manager.desiredAccuracy = kCLLocationAccuracyBest // 最高精度の位置情報を要求
        manager.distanceFilter = 3.0 // 更新距離(m)
        manager.startUpdatingLocation()
    }
    
    // 領域の更新をするデリゲートメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        // 配列の最後に最新のロケーションが格納される
        // map関数を使って全要素にアクセス map{ $0←要素に参照 }
        /*
        locations.last.map {
            let center = CLLocationCoordinate2D(
                latitude: $0.coordinate.latitude,
                longitude: $0.coordinate.longitude)

                // 地図を表示するための領域を再構築
                region = MKCoordinateRegion(
                    center: center,
                    latitudinalMeters: 1000.0,
                    longitudinalMeters: 1000.0
            )
        }
         */
    }
    
    
}
