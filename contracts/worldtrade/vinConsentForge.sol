contract vinConsentForge {
    mapping(address => bool) public fullConsentGivers;

    event ConsentForged(address indexed participant);

    function forgeConsent() public {
        fullConsentGivers[msg.sender] = true;
        emit ConsentForged(msg.sender);
    }

    function isConsentValid(address participant) public view returns (bool) {
        return fullConsentGivers[participant];
    }
}
