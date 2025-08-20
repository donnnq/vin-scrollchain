contract CivicReadinessBroadcast {
    address public steward = msg.sender;
    mapping(address => bool) public registeredAllies;

    event BroadcastSent(address ally, string message, string timestamp);

    function registerAlly(address ally) public {
        registeredAllies[ally] = true;
    }

    function sendBroadcast(address ally, string memory message, string memory timestamp) public {
        require(registeredAllies[ally], "Ally not registered");
        emit BroadcastSent(ally, message, timestamp);
    }
}
