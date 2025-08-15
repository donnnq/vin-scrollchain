// Recognizes soldiers who were forced into combat and purifies their civic record

pragma mythic;

contract ForcedCombatPurifier {
    string public soldierName;
    string public originCountry;
    bool public forcedToFight = true;
    string public purificationStatus = "Civic record purified. No blame assigned.";

    event RecordPurified(string name);

    function purifyRecord(string memory _name, string memory _country) public {
        soldierName = _name;
        originCountry = _country;
        emit RecordPurified(_name);
    }

    function viewStatus() public view returns (string memory) {
        return purificationStatus;
    }
}
