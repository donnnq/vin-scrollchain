// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title FreedomPort - Ritual gateway for dignified border entry
contract FreedomPort {
    address public scrollsmith;
    mapping(address => bool) public clearedTraveler;
    event TravelerCleared(address indexed traveler);
    event InterrogationDisabled(address indexed traveler);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function clearTraveler(address traveler) public onlyScrollsmith {
        clearedTraveler[traveler] = true;
        emit TravelerCleared(traveler);
        emit InterrogationDisabled(traveler);
    }

    function isCleared(address traveler) public view returns (bool) {
        return clearedTraveler[traveler];
    }
}
