/*
	Treehouse Techdegree: iOS - Project 1
	Team building exercise!
*/

/*
	---------------------
	Declaring player data
	---------------------
*/

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

//	Grouping all players together

var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

//	Creating empty teams
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

/*
	-----------------------------
	Sorting and Assigning Players
	-----------------------------
*/

//	Function to find the tallest player and return that index

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

//	Function to sort a group by height - initially I planned to sort each group after splitting new players from experienced, so I wrote it as a function, but it was more efficient to just sort the complete player list, as splitting them up doesn't reorder them.

func sortList(byHeight list: [[String: Any]]) -> [[String: Any]] {
	var tempList = list
	var sortedList: [[String: Any]] = []
	for _ in 1...list.count {
		let tallestInListIndex: Int = findTallest(inPlayerList: tempList)
		//	Add player to the sorted list and remove from the temp list so the next iteration will find the next tallest player
		sortedList.append(tempList[tallestInListIndex])
		tempList.remove(at: tallestInListIndex)
		}
	return sortedList
}

//	Sort the player list by height

players = sortList(byHeight: players)

/* 
	Split the players into experienced and new player lists.
	These will remain sorted by height.
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

//	Team height sum variables for calculating the averages
var teamSharksHeight: Int = 0
var teamDragonsHeight: Int = 0
var teamRaptorsHeight: Int = 0

/*
	Loop through both lists simultaneously pairing tallest-experienced with shortest-new players. 
	Assign those players to teams while adding up their heights to calculate the average later.
*/

//	loopCount to determine how many times to run the loop - half the players since we are assigning 2 players per iteration
let loopCount = players.count / 2
for i in 0..<loopCount {
	let experiencedPlayerHeight = experiencedList[i]["height"] as! Int
	let newPlayerHeight = newPlayerList[loopCount-i-1]["height"] as! Int
	//	Choose which team based on the loop iteration number
	switch (i + 1) % 3 {
	case 1: teamSharks.append(experiencedList[i])
			teamSharks.append(newPlayerList[loopCount-i-1])
			teamSharksHeight += experiencedPlayerHeight + newPlayerHeight
	case 2: teamDragons.append(experiencedList[i])
			teamDragons.append(newPlayerList[loopCount-i-1])
			teamDragonsHeight += experiencedPlayerHeight + newPlayerHeight
	default: teamRaptors.append(experiencedList[i])
			 teamRaptors.append(newPlayerList[loopCount-i-1])
			 teamRaptorsHeight += experiencedPlayerHeight + newPlayerHeight
	}
}

//	Calculate the teams average heights

func averageHeightWith(totalHeight: Int, playerCount: Int) -> Double {
	let average: Double = Double(totalHeight) / Double(playerCount)
	return average
}
let teamSharksAverageHeight = averageHeightWith(totalHeight: teamSharksHeight, playerCount: teamSharks.count)
let teamDragonsAverageHeight = averageHeightWith(totalHeight: teamDragonsHeight, playerCount: teamDragons.count)
let teamRaptorsAverageHeight = averageHeightWith(totalHeight: teamRaptorsHeight, playerCount: teamRaptors.count)

//	Print the team rosters to the console with names, heights, and experience level, and team average heights

func printRoster(ofTeam list: [[String: Any]]) {
	var experienced: String
	print("---------------------------------------")
	for teamMember in list {
		if teamMember["experienced"] as! Bool == true {
			experienced = "has played before"
		} else {
			experienced = "is a new player"
		}
		print("\(teamMember["name"]!) is \(teamMember["height"]!) inches tall, and " + experienced)
	}
	print()
}

print("Team Sharks       Average Height: \((teamSharksAverageHeight * 100).rounded() / 100)")
printRoster(ofTeam: teamSharks)
print("Team Dragons      Average Height: \((teamDragonsAverageHeight * 100).rounded() / 100)")
printRoster(ofTeam: teamDragons)
print("Team Raptors      Average Height: \((teamRaptorsAverageHeight * 100).rounded() / 100)")
printRoster(ofTeam: teamRaptors)

/*
	-------------------
	Prepare the letters
	-------------------
*/

let practiceSchedule = ["Team Dragons": "March 17 at 1pm", "Team Sharks": "March 17 at 3pm", "Team Raptors": "March 18 at 1pm"]

//	Function to compile the letter string
func createLetter(forPlayer player: [String: Any], ofTeam team: String) -> String {
	let letter: String = "\(player["guardian"]!),\n   \(player["name"]!) has been selected as a member of \(team).\n   \(team)'s first practice is on \(practiceSchedule[team]!). \n   We can't wait to see you there!\n"
	return letter
}

//	Initialize the letters collection
var letters: [String] = []

//	Build letters for all players in a team
func compileTeamLetters(forTeam team: [[String: Any]], withTeamName teamName: String){
	for players in team {
		letters.append(createLetter(forPlayer: players, ofTeam: teamName))
	}
}
//	Create all three teams letters and put them into one array
compileTeamLetters(forTeam: teamSharks, withTeamName: "Team Sharks")
compileTeamLetters(forTeam: teamDragons, withTeamName: "Team Dragons")
compileTeamLetters(forTeam: teamRaptors, withTeamName: "Team Raptors")

//	Print the letters array
for eachLetter in letters {
	print(eachLetter)
}