class MockData {
  static List<Map<String, dynamic>> getFakeMembers() {
    return [
      {
        "id": 1,
        "name": "Harry Smith",
        "email": "harry@example.com",
        "currentLocation": {
          "latitude":
              40.730610, // Example coordinates for John's current location
          "longitude": -73.935242
        },
        "visitedLocations": [
          {
            "location": "New York, NY",
            "coordinates": {"latitude": 40.7128, "longitude": -74.0060},
            "timestamp": "2024-09-20T10:00:00Z",
            "stopDuration": 15 // Duration in minutes
          },
          {
            "location": "Boston, MA",
            "coordinates": {"latitude": 42.3601, "longitude": -71.0589},
            "timestamp": "2024-09-19T12:00:00Z",
            "stopDuration": 30 // Duration in minutes
          }
        ]
      },
      {
    "id": 2,
    "name": "Mark Johnson",
    "email": "mark@example.com",
    "currentLocation": {
      "latitude": 40.730610,
      "longitude": -73.935242
    },
    "visitedLocations": [
      {
        "location": "New York, NY",
        "coordinates": {"latitude": 40.712776, "longitude": -74.005974},
        "timestamp": "2024-09-19T12:00:00Z",
        "stopDuration": 15
      },
      {
        "location": "Chicago, IL",
        "coordinates": {"latitude": 41.878113, "longitude": -87.629799},
        "timestamp": "2024-09-16T14:30:00Z",
        "stopDuration": 25
      }
    ]
  },
  {
    "id": 3,
    "name": "Emily Davis",
    "email": "emily@example.com",
    "currentLocation": {
      "latitude": 34.052235,
      "longitude": -118.243683
    },
    "visitedLocations": [
      {
        "location": "San Diego, CA",
        "coordinates": {"latitude": 32.715736, "longitude": -117.161087},
        "timestamp": "2024-09-21T10:00:00Z",
        "stopDuration": 30
      },
      {
        "location": "Las Vegas, NV",
        "coordinates": {"latitude": 36.169941, "longitude": -115.139832},
        "timestamp": "2024-09-15T17:00:00Z",
        "stopDuration": 40
      }
    ]
  },
  {
    "id": 4,
    "name": "Michael Brown",
    "email": "michael@example.com",
    "currentLocation": {
      "latitude": 41.292316,
      "longitude": -75.270082
    },
    "visitedLocations": [
      {
        "location": "Philadelphia, PA",
        "coordinates": {"latitude": 39.952583, "longitude": -75.165222},
        "timestamp": "2024-09-22T11:00:00Z",
        "stopDuration": 20
      },
      {
        "location": "Washington, D.C.",
        "coordinates": {"latitude": 38.907192, "longitude": -77.036871},
        "timestamp": "2024-09-19T09:30:00Z",
        "stopDuration": 50
      }
    ]
      },
      {
        "id": 5,
        "name": "Jane Oswald",
        "email": "jane@example.com",
        "currentLocation": {
          "latitude":
              37.804363, // Example coordinates for Jane's current location
          "longitude": -122.271111
        },
        "visitedLocations": [
          {
            "location": "San Francisco, CA",
            "coordinates": {"latitude": 37.7749, "longitude": -122.4194},
            "timestamp": "2024-09-20T09:00:00Z",
            "stopDuration": 10 // Duration in minutes
          },
          {
            "location": "Los Angeles, CA",
            "coordinates": {"latitude": 34.0522, "longitude": -118.2437},
            "timestamp": "2024-09-18T15:00:00Z",
            "stopDuration": 20 // Duration in minutes
          }
        

        ]
      }
    ];
  }
}
