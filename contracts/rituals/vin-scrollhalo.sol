contract vinScrollHalo {
    string public covenant = "Laugh, lift, liberate.";

    mapping(address => bool) public hasLightness;
    event GiggleValidated(address indexed soul);

    modifier onlyEnlightened() {
        require(hasLightness[msg.sender], "Need genuine laughter to proceed.");
        _;
    }

    function offerChuckle(string memory reason) public {
        require(bytes(reason).length > 3, "No shallow chuckles.");
        hasLightness[msg.sender] = true;
        emit GiggleValidated(msg.sender);
    }

    function activateHalo() public view onlyEnlightened returns (string memory) {
        return "☀️ ScrollHalo active. Your burdens are now redistributed.";
    }
}
