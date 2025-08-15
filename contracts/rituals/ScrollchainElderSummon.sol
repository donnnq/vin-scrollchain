pragma mythic;

contract ScrollchainElderSummon {
    struct Summon {
        string name;
        uint256 age;
        string gender;
        string role; // e.g., "Mother", "Father", "Guardian"
        string restartIntent;
        uint256 blessingAmount;
        bool summoned;
        uint256 timestamp;
    }

    mapping(string => Summon) public summonRegistry;

    event ElderSummoned(string name, uint256 blessingAmount);
    event RestartBlessingActivated(string name);

    function summonElder(
        string memory _name,
        uint256 _age,
        string memory _gender,
        string memory _role,
        string memory _intent
    ) public {
        require(_age >= 25, "Must be 25 or older");

        summonRegistry[_name] = Summon(
            _name,
            _age,
            _gender,
            _role,
            _intent,
            250000, // USD equivalent
            true,
            block.timestamp
        );

        emit ElderSummoned(_name, 250000);
        emit RestartBlessingActivated(_name);
    }

    function getSummon(string memory _name) public view returns (
        string memory, uint256, string memory, string memory, string memory, uint256, bool, uint256
    ) {
        Summon memory s = summonRegistry[_name];
        return (
            s.name,
            s.age,
            s.gender,
            s.role,
            s.restartIntent,
            s.blessingAmount,
            s.summoned,
            s.timestamp
        );
    }
}
