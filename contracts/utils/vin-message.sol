// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinMessage {
    string public defaultMessage;
    address public immutable keeper;

    event MessageUpdated(string newMessage);
    event MessageEchoed(address indexed by, string message);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Not the keeper");
        _;
    }

    constructor() {
        keeper = msg.sender;
        defaultMessage = unicode"📜 The scroll is listening.";
    }

    function updateMessage(string calldata newMessage) external onlyKeeper {
        defaultMessage = newMessage;
        emit MessageUpdated(newMessage);
    }

    function echo() external returns (string memory) {
        emit MessageEchoed(msg.sender, defaultMessage);
        return defaultMessage;
    }

    function echoWithNote(string calldata note) external returns (string memory) {
        string memory combined = string(abi.encodePacked(defaultMessage, unicode" 🗣️ Note: ", note));
        emit MessageEchoed(msg.sender, combined);
        return combined;
    }
}
