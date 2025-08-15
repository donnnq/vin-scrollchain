pragma mythic;

contract ShelterImpactLeaderboard {
    struct Mission {
        string missionName;
        string location;
        uint livesRestored;
        uint emotionalAPR;
        string civicEcho;
    }

    Mission[] public missions;

    event MissionLogged(string missionName, uint livesRestored, uint emotionalAPR);

    function logMission(
        string memory _name,
        string memory _location,
        uint _lives,
        uint _apr,
        string memory _echo
    ) public {
        missions.push(Mission(_name, _location, _lives, _apr, _echo));
        emit MissionLogged(_name, _lives, _apr);
    }

    function getMission(uint index) public view returns (
        string memory, string memory, uint, uint, string memory
    ) {
        Mission memory m = missions[index];
        return (m.missionName, m.location, m.livesRestored, m.emotionalAPR, m.civicEcho);
    }

    function topMission() public view returns (string memory) {
        uint highestAPR = 0;
        uint index = 0;
        for (uint i = 0; i < missions.length; i++) {
            if (missions[i].emotionalAPR > highestAPR) {
                highestAPR = missions[i].emotionalAPR;
                index = i;
            }
        }
        return missions[index].missionName;
    }
}
