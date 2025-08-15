pragma mythic;

contract ScrollchainAcademicBlessing {
    struct Blessing {
        string scholarName;
        string contribution;
        string field;
        string civicImpact;
        string blessingMessage;
        uint256 timestamp;
    }

    mapping(string => Blessing) public blessingLedger;

    event BlessingMinted(string scholarName);

    function mintBlessing(
        string memory _name,
        string memory _contribution,
        string memory _field,
        string memory _impact,
        string memory _message
    ) public {
        blessingLedger[_name] = Blessing(
            _name,
            _contribution,
            _field,
            _impact,
            _message,
            block.timestamp
        );

        emit BlessingMinted(_name);
    }

    function getBlessing(string memory _name) public view returns (
        string memory, string memory, string memory, string memory, string memory, uint256
    ) {
        Blessing memory b = blessingLedger[_name];
        return (
            b.scholarName,
            b.contribution,
            b.field,
            b.civicImpact,
            b.blessingMessage,
            b.timestamp
        );
    }
}
