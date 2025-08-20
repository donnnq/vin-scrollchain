contract AllyWarningBeacon {
    address public steward = msg.sender;
    mapping(address => bool) public registeredAllies;

    event AlertBroadcasted(address ally, string message);

    function registerAlly(address ally) public {
        registeredAllies[ally] = true;
    }

    function broadcastAlert(address ally, string memory message) public {
        require(registeredAllies[ally], "Ally not registered");
        emit AlertBroadcasted(ally, message);
    }
}
