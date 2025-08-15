pragma mythic;

contract ScrollchainShelterSummon {
    struct Summon {
        string entityName;
        string specialization;
        string summonMessage;
        string location;
        string summonDate;
        bool acknowledged;
    }

    Summon[] public shelterSummons;

    event ShelterEntitySummoned(string entityName, string message);

    function summonEntity(
        string memory _name,
        string memory _specialization,
        string memory _message,
        string memory _location,
        string memory _date
    ) public {
        shelterSummons.push(Summon(_name, _specialization, _message, _location, _date, false));
        emit ShelterEntitySummoned(_name, _message);
    }

    function acknowledgeSummon(uint index) public {
        shelterSummons[index].acknowledged = true;
    }

    function getSummon(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool
    ) {
        Summon memory s = shelterSummons[index];
        return (
            s.entityName,
            s.specialization,
            s.summonMessage,
            s.location,
            s.summonDate,
            s.acknowledged
        );
    }
}
