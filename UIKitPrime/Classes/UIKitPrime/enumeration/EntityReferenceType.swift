//
//  Logger.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 25/11/2018.
//

public enum EntityReferenceType: Int, CustomStringConvertible {

	case poi = 10
	case poiGroup = 11
	case poiCluster = 12
	case event = 21
	case eventGroup = 22
	case eventCluster = 23
	case item = 31
	case itemGroup = 32
	case itemCluster = 33
	case ar = 41
	case arGroup = 42
	case arCluster = 43
	case newsItem = 51
	case newsGroup = 52
	case newsCluster = 53
	case beacon = 61
	case beaconGroup = 62
	case beaconCluster = 63

	public var description: String {
		get {
			switch self {
			case .poi:
				return "Poi"

			case .poiGroup:
				return "PoiGroup"

			case .poiCluster:
				return "PoiCluster"

			case .event:
				return "Event"

			case .eventGroup:
				return "EventGroup"

			case .eventCluster:
				return "EventCluster"

			case .item:
				return "Item"

			case .itemGroup:
				return "ItemGroup"

			case .itemCluster:
				return "ItemCluster"

			case .ar:
				return "Ar"

			case .arGroup:
				return "ArGroup"

			case .arCluster:
				return "ArCluster"

			case .newsItem:
				return "NewsItem"

			case .newsGroup:
				return "NewsGroup"

			case .newsCluster:
				return "NewsCluster"

			case .beacon:
				return "Beacon"

			case .beaconGroup:
				return "BeaconGroup"

			case .beaconCluster:
				return "BeaconCluster"

			}
		}
	}

	public static func parseFromString(_ value: String?) -> EntityReferenceType? {

		if let value = value {
			switch value {
			case "Poi":
				return poi

			case "PoiGroup":
				return poiGroup

			case "PoiCluster":
				return poiCluster

			case "Event":
				return event

			case "EventGroup":
				return eventGroup

			case "EventCluster":
				return eventCluster

			case "Item":
				return item

			case "ItemGroup":
				return itemGroup

			case "ItemCluster":
				return itemCluster

			case "Ar":
				return ar

			case "ArGroup":
				return arGroup

			case "ArCluster":
				return arCluster

			case "NewsItem":
				return newsItem

			case "NewsGroup":
				return newsGroup

			case "NewsCluster":
				return newsCluster

			case "Beacon":
				return beacon

			case "BeaconGroup":
				return beaconGroup

			case "BeaconCluster":
				return beaconCluster

			default:
				return nil
			}
		}

		return nil
	}
}
