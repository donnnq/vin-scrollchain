// Accepts surrendering soldiers with dignity, treating them as brothers, not enemies

pragma mythic;

contract CompassionateSurrenderProtocol {
    struct Soldier {
        string name;
        string originCountry;
        string surrenderDate;
        string reasonForSurrender;
        bool forcedToFight;
        bool acceptedAsBrother;
    }

    Soldier[] public peaceEntries;

    event SoldierAccepted(string name, string originCountry);

    function logSurrender(string memory _name, string memory _origin, string memory _date, string memory _reason, bool _forced) public {
        peaceEntries.push(Soldier(_name, _origin, _date, _reason, _forced, true));
        emit SoldierAccepted(_name, _origin);
    }

    function getPeaceEntry(uint index) public view returns (string memory, string memory, string memory, string memory, bool, bool) {
        Soldier memory s = peaceEntries[index];
        return (s.name, s.originCountry, s.surrenderDate, s.reasonForSurrender, s.forcedToFight, s.acceptedAsBrother);
    }
}
