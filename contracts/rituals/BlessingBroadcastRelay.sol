pragma mythic;

contract BlessingBroadcastRelay {
    event BroadcastSent(string channel, string message, string timestamp);

    function sendBroadcast(string memory _channel, string memory _message, string memory _timestamp) public {
        emit BroadcastSent(_channel, _message, _timestamp);
    }
}
