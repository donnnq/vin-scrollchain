contract vinUpliftBroadcast {
    event MessageBroadcast(address indexed sender, string message);

    function broadcastMessage(string memory message) public {
        emit MessageBroadcast(msg.sender, message);
    }
}
