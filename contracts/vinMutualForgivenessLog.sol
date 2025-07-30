contract vinMutualForgivenessLog {
    mapping(address => string[]) public forgivenessEntries;
    event ForgivenessLogged(address indexed participant, string reason);

    function logForgiveness(string memory reason) public {
        forgivenessEntries[msg.sender].push(reason);
        emit ForgivenessLogged(msg.sender, reason);
    }

    function getEntries(address participant) public view returns (string[] memory) {
        return forgivenessEntries[participant];
    }
}
