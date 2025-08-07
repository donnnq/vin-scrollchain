pragma solidity ^0.8.20;

contract vinWaterwaySpiritAuditDAO {
    address public steward;

    struct RiverSpirit {
        string name;
        string location;
        uint256 ecologicalHealth; // 0 to 100 scale
        bool dredgedRecently;
        string folkloricName;
        string citizenOffering; // symbolic info e.g. poem, pledge
        string auditHash;
    }

    RiverSpirit[] public spirits;

    event SpiritLogged(string name, uint256 health);
    event SpiritVowed(string folkloricName, string citizenOffering);

    constructor() {
        steward = msg.sender;
    }

    function logSpirit(
        string memory _name,
        string memory _location,
        uint256 _ecologicalHealth,
        bool _dredgedRecently,
        string memory _folkloricName,
        string memory _auditHash
    ) public {
        spirits.push(RiverSpirit(
            _name,
            _location,
            _ecologicalHealth,
            _dredgedRecently,
            _folkloricName,
            "",
            _auditHash
        ));
        emit SpiritLogged(_name, _ecologicalHealth);
    }

    function vowToSpirit(uint256 _index, string memory _citizenOffering) public {
        require(_index < spirits.length, "Invalid spirit index");
        spirits[_index].citizenOffering = _citizenOffering;
        emit SpiritVowed(spirits[_index].folkloricName, _citizenOffering);
    }

    function inspectSpirit(uint256 _index) public view returns (RiverSpirit memory) {
        require(_index < spirits.length, "Invalid spirit index");
        return spirits[_index];
    }
}
