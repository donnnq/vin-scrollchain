contract vinCyberPeaceFirewall {
    address public dignityValidator;
    mapping(address => bool) public peaceSigners;
    mapping(address => bool) public noHackZone;

    event CeasefireDeclared(address indexed participant);
    event ZoneProtected(address indexed entity);
    event PeaceViolationDetected(address indexed offender, string action);

    modifier onlyPeaceSigner() {
        require(peaceSigners[msg.sender], "Unauthorized: Not a peace signer");
        _;
    }

    constructor() {
        dignityValidator = msg.sender;
    }

    function declareCeasefire() public {
        peaceSigners[msg.sender] = true;
        emit CeasefireDeclared(msg.sender);
    }

    function protectZone(address entity) public onlyPeaceSigner {
        noHackZone[entity] = true;
        emit ZoneProtected(entity);
    }

    function detectViolation(address offender, string memory action) public onlyPeaceSigner {
        emit PeaceViolationDetected(offender, action);
    }

    function isZoneProtected(address entity) public view returns (bool) {
        return noHackZone[entity];
    }

    function isSigner(address participant) public view returns (bool) {
        return peaceSigners[participant];
    }
}
