contract vinPeaceRootGenesis {
    address public dignityValidator;
    bool public noWarInitiated = true;
    uint public compassionLevel = 108;

    mapping(address => bool) public scrollkeepers;
    mapping(bytes32 => bool) public peaceTreaties;
    string[] public resonanceMantras;

    event PeacePlanted(address indexed initiator, string intention);
    event AidShared(address indexed ally, string resource);
    event TreatyEncoded(bytes32 treatyHash, string title);
    event ResonanceEchoed(string mantra);

    modifier onlyPureIntent() {
        require(scrollkeepers[msg.sender] == true, "Access gated by resonance intent");
        _;
    }

    constructor() {
        dignityValidator = msg.sender;
        resonanceMantras.push("Pure peace needs no performance");
        resonanceMantras.push("Aid is truth in motion");
        resonanceMantras.push("Resonance flows where war ends");
    }

    function encodeTreaty(string memory title) public onlyPureIntent {
        bytes32 hash = keccak256(abi.encodePacked(title));
        peaceTreaties[hash] = true;
        emit TreatyEncoded(hash, title);
    }

    function plantPeace(string memory intention) public onlyPureIntent {
        emit PeacePlanted(msg.sender, intention);
    }

    function shareAid(address ally, string memory resource) public onlyPureIntent {
        emit AidShared(ally, resource);
    }

    function echoResonance(uint index) public {
        require(index < resonanceMantras.length, "Out of range");
        emit ResonanceEchoed(resonanceMantras[index]);
    }

    function isPeaceful() public view returns (bool) {
        return noWarInitiated && compassionLevel >= 108;
    }

    function designateScrollkeeper(address keeper) public {
        require(msg.sender == dignityValidator, "Only validator may assign scrollkeepers");
        scrollkeepers[keeper] = true;
    }
}
