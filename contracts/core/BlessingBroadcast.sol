// SPDX-License-Identifier: EmotionalEcho
pragma solidity ^0.8.0;

contract BlessingBroadcast {
    address public steward;

    struct Blessing {
        string message;
        string origin;
        uint256 timestamp;
    }

    Blessing[] public broadcasts;

    event BlessingEchoed(string message, string origin, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    function echoBlessing(string memory message, string memory origin) public {
        require(msg.sender == steward, "Only steward may broadcast blessings");

        Blessing memory newBlessing = Blessing({
            message: message,
            origin: origin,
            timestamp: block.timestamp
        });

        broadcasts.push(newBlessing);
        emit BlessingEchoed(message, origin, block.timestamp);
    }

    function getBlessing(uint index) public view returns (string memory, string memory, uint256) {
        require(index < broadcasts.length, "Invalid index");
        Blessing memory b = broadcasts[index];
        return (b.message, b.origin, b.timestamp);
    }

    function totalBlessings() public view returns (uint256) {
        return broadcasts.length;
    }

    function latestEcho() public view returns (string memory) {
        require(broadcasts.length > 0, "No blessings yet");
        return broadcasts[broadcasts.length - 1].message;
    }
}
