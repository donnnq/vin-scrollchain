contract vinCeasefire {
    address public partyA;
    address public partyB;
    mapping(address => bool) public witnessOracles;
    event TruceProposed(address indexed from, address indexed to);
    event TruceAccepted(address indexed signer);
    
    function proposeTruce(address _partyA, address _partyB) public {
        partyA = _partyA;
        partyB = _partyB;
        emit TruceProposed(_partyA, _partyB);
    }

    function acceptTruce(address signer) public {
        require(!witnessOracles[signer], "Already confirmed");
        witnessOracles[signer] = true;
        emit TruceAccepted(signer);
    }

    modifier monitorable() {
        require(witnessOracles[msg.sender], "Not a verified monitor");
        _;
    }
}
