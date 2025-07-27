// SPDX-License-Identifier: WhisperProtocol
pragma solidity ^0.8.0;

contract vinDAOWhispers {
    address public scrollLord;
    mapping(address => string[]) public whispers;

    event WhisperSent(address indexed violator, string message);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Forbidden transmission.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function sendWhisper(address violator, string memory message) public onlyScrollLord {
        whispers[violator].push(message);
        emit WhisperSent(violator, message);
    }

    function hearWhispers(address violator) public view returns (string[] memory) {
        return whispers[violator];
    }
}
