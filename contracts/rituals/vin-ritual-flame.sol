// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinRitualFlame {
    struct Flame {
        address igniter;
        string message;
        uint256 timestamp;
    }

    Flame[] public flames;

    event FlameLit(address indexed igniter, string message, uint256 indexed flameId, uint256 timestamp);

    function lightFlame(string calldata message) external {
        flames.push(Flame({
            igniter: msg.sender,
            message: message,
            timestamp: block.timestamp
        }));

        emit FlameLit(msg.sender, message, flames.length - 1, block.timestamp);
    }

    function totalFlames() external view returns (uint256) {
        return flames.length;
    }

    function getFlame(uint256 index) external view returns (Flame memory) {
        require(index < flames.length, "Invalid flame index");
        return flames[index];
    }
}
