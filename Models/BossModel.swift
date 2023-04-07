import Foundation

// Boss Model

let bosses = [
    Boss(name: "Isaac", maxHealth: 3, currentHealth: 3),
    Boss(name: "Gommin", maxHealth: 4, currentHealth: 4),
    Boss(name : "Tim", maxHealth: 5, currentHealth: 5)
]

struct Boss {
    let name: String
    let maxHealth: Double
    var currentHealth: Int
}
