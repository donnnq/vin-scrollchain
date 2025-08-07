// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSignalBroadcastMirror {
    event SignalReflected(address indexed origin, string content);
    address public controller;

    constructor() {
        controller = msg.sender;
    }

    function reflectSignal(string memory content) external {
        require(msg.sender == controller, "Unauthorized reflection.");
        emit SignalReflected(msg.sender, content);
    }

    function updateController(address newController) external {
        require(msg.sender == controller, "Only current controller allowed.");
        controller = newController;
    }
}
