const rooms = [
    "Storage",
    "Living Room",
    "Dining Room",
    "Kitchen",
    "Bedroom",
    "Office",
    "Bathroom",
    "Nursery",
    "Attic",
    "Basement",
    "Foyer/Entry/Hall",
    "Garage",
    "Laundry Room",
    "Shed/Barn",
    "Yard/Garden"
]

function extractFurniture() {
    let room = document
        .querySelector("h1 > span:nth-child(2)")
        .innerText
        .replace(/\d+/g, '')
        .trim()

    let titles = [...document.querySelectorAll(".title")]
    let furniture = titles.map(title => title.innerText.replace(/^[0-9]\n/g, ''))
    return { name: room, furniture }
}

export const roomData = [
    {
        "name": "Storage",
        "furniture": [
            "Trunk",
            "Stroller/Carriage",
            "Stool",
            "Game Table",
            "Ladder",
            "Plastic Bin (Rubbermaid)",
            "Safe",
            "Ski/ Snowboard",
            "Utility Cabinet",
            "Power Tool Stand",
            "Shelving Unit",
            "Small Chair",
            "Large Chair",
            "Tube TV"
        ]
    },
    {
        "name": "Living Room",
        "furniture": [
            "Trunk",
            "Air Conditioner",
            "Painting/Artwork",
            "Mirror",
            "Television",
            "Bar",
            "Coffee Table",
            "End Table",
            "Large Cabinet",
            "Piano",
            "Loveseat/ Chaise Lounge",
            "Small Chair",
            "Large Chair",
            "Large Rug",
            "Table Lamp",
            "Floor Lamp",
            "Large Bookcase",
            "Small Bookcase",
            "Large Entertainment Center",
            "Small Entertainment Center",
            "Sleeper Sofa",
            "Standard Sofa",
            "Tube TV",
            "Ottoman/Foot Rest"
        ]
    }, {
        "name": "Dining Room",
        "furniture": [
            "Baker’s Rack",
            "Hutch",
            "Painting/Artwork",
            "Stool",
            "Dining/ Kitchen Table",
            "Mirror",
            "Bar",
            "Buffet/Sideboard",
            "Large Cabinet",
            "Occasional Table",
            "Small Chair",
            "Large Chair",
            "Large Rug",
            "Table Lamp",
            "Floor Lamp",
            "Large Bookcase",
            "Small Bookcase"
        ]
    }, {
        "name": "Kitchen",
        "furniture": [
            "Washing Machine",
            "Dryer",
            "Baker’s Rack",
            "Microwave",
            "Kitchen Island",
            "Dishwasher",
            "Stool",
            "Dining/ Kitchen Table",
            "Television",
            "Large Cabinet",
            "Refrigerator",
            "Small Chair"
        ]
    }, {
        "name": "Bedroom",
        "furniture": [
            "Bassinet",
            "Air Conditioner",
            "Night Stand",
            "Clothes Hamper",
            "Armoire",
            "Painting/Artwork",
            "Crib",
            "Plastic Bin (Rubbermaid)",
            "Mirror",
            "Full/Queen Bed",
            "Television",
            "Small Chair",
            "Large Chair",
            "Large Rug",
            "Table Lamp",
            "Floor Lamp",
            "Small Desk",
            "Single Dresser",
            "Double Dresser",
            "Triple Dresser",
            "Twin Bed",
            "Bunk Bed",
            "King Bed",
            "Tube TV"
        ]
    }, {
        "name": "Office",
        "furniture": [
            "Air Conditioner",
            "Armoire",
            "Desk, Large",
            "Painting/Artwork",
            "Chair, Small",
            "Television",
            "Large Office Chair",
            "Credenza",
            "Computer",
            "Large Filing Cabinet",
            "Small Chair",
            "Table Lamp",
            "Floor Lamp",
            "Large Bookcase",
            "Small Bookcase",
            "Large Desk",
            "Desk, Small"
        ]
    }, {
        "name": "Bathroom",
        "furniture": [
            "Clothes Hamper",
            "Painting/Artwork",
            "Small Cabinet",
            "Bathroom Cabinet",
            "Mirror"
        ]
    }, {
        "name": "Nursery",
        "furniture": [
            "Bassinet",
            "Night Stand",
            "Clothes Hamper",
            "Armoire",
            "Painting/Artwork",
            "Crib",
            "Mirror",
            "Changing Table",
            "Small Chair",
            "Large Chair",
            "Large Rug",
            "Table Lamp",
            "Floor Lamp",
            "Single Dresser",
            "Double Dresser",
            "Large Bookcase",
            "Small Bookcase",
            "Twin Bed"
        ]
    }, {
        "name": "Attic",
        "furniture": [
            "Trunk",
            "Air Conditioner",
            "Stroller/Carriage",
            "Golf Clubs/Bag",
            "Stool",
            "Dining/ Kitchen Table",
            "Game Table",
            "Ladder",
            "Plastic Bin (Rubbermaid)",
            "Safe",
            "Ski/ Snowboard",
            "Toolchest",
            "Small Chair",
            "Large Chair"
        ]
    }, {
        "name": "Basement",
        "furniture": [
            "Trunk",
            "Outdoor Bench",
            "Air Conditioner",
            "Washing Machine",
            "Stroller/Carriage",
            "Golf Clubs/Bag",
            "Dryer",
            "Stool",
            "Game Table",
            "Ladder",
            "Plastic Bin (Rubbermaid)",
            "Safe",
            "Ski/ Snowboard",
            "Toolchest",
            "Freezer, Mid-Sized",
            "Utility Cabinet",
            "Small Chair",
            "Large Chair",
            "Tube TV"
        ]
    }, {
        "name": "Foyer/Entry/Hall",
        "furniture": [
            "Trunk",
            "Washing Machine",
            "Golf Clubs/Bag",
            "Dryer",
            "Painting/Artwork",
            "Mirror",
            "End Table",
            "Large Cabinet",
            "Occasional Table",
            "Indoor Bench",
            "Small Chair",
            "Large Chair",
            "Large Rug",
            "Table Lamp",
            "Floor Lamp",
            "Large Bookcase",
            "Small Bookcase"
        ]
    }, {
        "name": "Garage",
        "furniture": [
            "Outdoor Bench",
            "Wheelbarrow",
            "Stroller/Carriage",
            "Golf Clubs/Bag",
            "Tire",
            "Snowblower",
            "Ladder",
            "Plastic Bin (Rubbermaid)",
            "Toolchest",
            "Utility Cabinet",
            "BBQ Grill, Medium",
            "Small Outdoor Chair",
            "Large Outdoor Chair",
            "Lawn Mower, Hand",
            "Power Tool Stand",
            "Canoe/ Kayak",
            "Small Chair",
            "Large Chair",
            "Tube TV"
        ]
    }, {
        "name": "Laundry Room",
        "furniture": [
            "Trunk",
            "Washing Machine",
            "Clothes Hamper",
            "Dryer",
            "Stool",
            "Plastic Bin (Rubbermaid)",
            "Toolchest",
            "Utility Cabinet",
            "Indoor Bench",
            "Small Chair"
        ]
    }, {
        "name": "Shed/Barn",
        "furniture": [
            "Wheelbarrow",
            "Golf Clubs/Bag",
            "Tire",
            "Snowblower",
            "Stool",
            "Ladder",
            "Plastic Bin (Rubbermaid)",
            "Ski/ Snowboard",
            "Toolchest",
            "Utility Cabinet",
            "Lawn Mower, Hand",
            "Power Tool Stand",
            "Canoe/ Kayak",
            "Shelving Unit",
            "Small Chair"
        ]
    }, {
        "name": "Yard/Garden",
        "furniture": [
            "Outdoor Bench",
            "Wheelbarrow",
            "Plant Stand",
            "Snowblower",
            "Ladder",
            "BBQ Grill, Medium",
            "Small Outdoor Chair",
            "Large Outdoor Chair",
            "Outdoor Sofa",
            "Large Outdoor Table",
            "Lawn Mower, Hand",
            "Small Chair",
            "Large Chair"
        ]
    }
]