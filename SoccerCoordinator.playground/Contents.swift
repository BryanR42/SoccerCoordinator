
// Declaring player data

let player1: [String: Any] = ["name": "Joe Smith", "height": 42, "experienced": true, "guardian": "Jim and Jan Smith"]
let player2: [String: Any] = ["name": "Jill Tanner", "height": 36, "experienced": true, "guardian": "Clara Tanner"]
let player3: [String: Any] = ["name": "Bill Bon", "height": 43, "experienced": true, "guardian": "Sara and Jenny Bon"]
let player4: [String: Any] = ["name": "Eva Gordon", "height": 45, "experienced": false, "guardian": "Wendy and Mike Gordon"]
let player5: [String: Any] = ["name": "Matt Gill", "height": 40, "experienced": false, "guardian": "Charles and Sylvia Gill"]
let player6: [String: Any] = ["name": "Kimmy Stein", "height": 41, "experienced": false, "guardian": "Bill and Hillary Stein"]
let player7: [String: Any] = ["name": "Sammy Adams", "height": 45, "experienced": false, "guardian": "Jeff Adams"]
let player8: [String: Any] = ["name": "Karl Saygan", "height": 42, "experienced": true, "guardian": "Heather Bledsoe"]
let player9: [String: Any] = ["name": "Suzane Greenberg", "height": 44, "experienced": true, "guardian": "Henrietta Dumas"]
let player10: [String: Any] = ["name": "Sal Dali", "height": 41, "experienced": false, "guardian": "Gala Dali"]
let player11: [String: Any] = ["name": "Joe Kavalier", "height": 39, "experienced": false, "guardian": "Sam and Elaine Kavalier"]
let player12: [String: Any] = ["name": "Ben Finkelstein", "height": 44, "experienced": false, "guardian": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = ["name": "Diego Soto", "height": 41, "experienced": true, "guardian": "Robin and Sarika Soto"]
let player14: [String: Any] = ["name": "Chloe Alaska", "height": 47, "experienced": false, "guardian": "David and Jamie Alaksa"]
let player15: [String: Any] = ["name": "Arnold Willis", "height": 43, "experienced": false, "guardian": "Claire Willis"]
let player16: [String: Any] = ["name": "Phillip Helm", "height": 44, "experienced": true, "guardian": "Thomas Helm and Eva Jones"]
let player17: [String: Any] = ["name": "Les Clay", "height": 42, "experienced": true, "guardian": "Wynonna Brown"]
let player18: [String: Any] = ["name": "Herschel Krustofski", "height": 45, "experienced": true, "guardian": "Hyman and Rachel Krustofski"]

var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]



//	find the tallest and return that index

func findTallest(inPlayerList list: [[String: Any]]) -> Int {
	var tallestIndex = 0
//	loop through each player comparing height to find the tallest
	for i in 1..<list.count {
		
		if list[i]["height"] as! Int > list[tallestIndex]["height"] as! Int {
			tallestIndex = i
		}
	}
	return tallestIndex
}

//	function to sort a group by height

func sortList(byHeight list: [[String: Any]]) -> [[String: Any]] {
	var tempList = list
	var sortedList: [[String: Any]] = []
	for _ in 1...list.count {
		let tallestInListIndex: Int = findTallest(inPlayerList: tempList)
		//use the index returned to add the the sorted list and remove from the temp list so the next iteration will find the next tallest
		sortedList.append(tempList[tallestInListIndex])
		tempList.remove(at: tallestInListIndex)
		}
	return sortedList
}

//	sort the player list by height
players = sortList(byHeight: players)

/* 
	split the players int experienced and new player lists which will remain
	sorted by height
*/

var experiencedList: [[String: Any]] = []
var newPlayerList: [[String: Any]] = []

for player in players {
	
	if player["experienced"] as! Bool {
		experiencedList.append(player)
	} else {
		newPlayerList.append(player)
	}
}

/*	
	Assign teams using "tallest:shortest" combinations.
	The results should end up with three roughly equal groups.
*/

// Team height sum variables for calculating the averages
var teamSharksHeight: Int = 0
var teamDragonsHeight: Int = 0
var teamRaptorsHeight: Int = 0
for i in 0..<(players.count / 2) {
	let experiencedPlayerHeight = experiencedList[i]["height"] as! Int
	let newPlayerHeight = newPlayerList[8-i]["height"] as! Int
	switch (i + 1) % 3 {
	case 0: teamSharksHeight += experiencedPlayerHeight + newPlayerHeight
	// add players to teams here
		
	case 1: teamDragonsHeight += experiencedPlayerHeight + newPlayerHeight
	default: teamRaptorsHeight += experiencedPlayerHeight + newPlayerHeight
	}
}
let teamSharksAverage = Double(teamSharksHeight) / 6.0
let teamDragonsAverage = Double(teamDragonsHeight) / 6.0
let teamRaptorsAverage = Double(teamRaptorsHeight) / 6.0


