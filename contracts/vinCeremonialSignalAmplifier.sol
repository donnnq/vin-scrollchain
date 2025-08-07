pragma solidity ^0.8.0;

contract vinCeremonialSignalAmplifier {
    address public steward;

    struct Broadcast {
        address worker;
        string name;
        string message;
        string badgeTitle;
        uint256 signalTime;
    }

    Broadcast[] public broadcasts;

    event BroadcastSent(address indexed worker, string badgeTitle, string message);

    function sendBroadcast(
        address _worker,
        string memory _name,
        string memory _badgeTitle,
        string memory _message
    ) public {
        require(msg.sender == steward, "Only steward");

        broadcasts.push(Broadcast(_worker, _name, _message, _badgeTitle, block.timestamp));
        emit BroadcastSent(_worker, _badgeTitle, _message);
    }

    function viewBroadcasts() public view returns (Broadcast[] memory) {
        return broadcasts;
    }
}
