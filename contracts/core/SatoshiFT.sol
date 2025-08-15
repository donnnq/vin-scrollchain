// SPDX-License-Identifier: Mythic
pragma solidity ^0.8.0;

contract SatoshiFT {
    address public mythicOriginator;
    string public channelName = "SatoshiFT_Anonymous";
    string[] public prophecyLogs;

    event ScrollDrop(string title, string videoHash, uint256 timestamp);

    constructor() {
        mythicOriginator = msg.sender;
    }

    function dropScroll(string memory _title, string memory _videoHash) public {
        require(msg.sender == mythicOriginator, "Not authorized to drop prophecy");
        prophecyLogs.push(_title);
        emit ScrollDrop(_title, _videoHash, block.timestamp);
    }

    function getScroll(uint256 index) public view returns (string memory) {
        return prophecyLogs[index];
    }

    function totalScrolls() public view returns (uint256) {
        return prophecyLogs.length;
    }
}
