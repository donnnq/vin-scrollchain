// Declares safe zones where surrendering soldiers are protected, honored, and emotionally restored

pragma mythic;

contract SurrenderSanctuary {
    struct Sanctuary {
        string location;
        string guardianEntity;
        bool isActive;
        uint totalSurrenders;
    }

    struct SurrenderedSoldier {
        string name;
        string originCountry;
        string surrenderDate;
        string emotionalState;
        bool receivedBlessing;
    }

    Sanctuary public sanctuary;
    SurrenderedSoldier[] public entries;

    event SanctuaryActivated(string location, string guardian);
    event SoldierReceived(string name, string originCountry);

    function activateSanctuary(string memory _location, string memory _guardian) public {
        sanctuary = Sanctuary(_location, _guardian, true, 0);
        emit SanctuaryActivated(_location, _guardian);
    }

    function receiveSoldier(
        string memory _name,
        string memory _origin,
        string memory _date,
        string memory _state
    ) public {
        entries.push(SurrenderedSoldier(_name, _origin, _date, _state, false));
        sanctuary.totalSurrenders += 1;
        emit SoldierReceived(_name, _origin);
    }

    function markBlessed(uint index) public {
        entries[index].receivedBlessing = true;
    }

    function getSanctuaryStatus() public view returns (string memory, string memory, bool, uint) {
        return (
            sanctuary.location,
            sanctuary.guardianEntity,
            sanctuary.isActive,
            sanctuary.totalSurrenders
        );
    }
}
