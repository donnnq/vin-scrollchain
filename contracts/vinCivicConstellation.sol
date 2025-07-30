// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinCivicConstellation.sol
/// @notice Links civic contracts into a unified constellation of governance and dignity.

contract vinCivicConstellation {
    address public scrollsmith;
    uint public linkedCount;

    struct CivicScroll {
        string name;
        address contractAddress;
        string purpose;
        uint timestamp;
    }

    mapping(uint => CivicScroll) public civicRegistry;

    event ScrollLinked(string name, address indexed contractAddress, string purpose);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    function linkScroll(string memory name, address contractAddress, string memory purpose) public onlyScrollsmith {
        civicRegistry[linkedCount++] = CivicScroll(name, contractAddress, purpose, block.timestamp);
        emit ScrollLinked(name, contractAddress, purpose);
    }

    function getScroll(uint id) public view returns (CivicScroll memory) {
        require(id < linkedCount, "Invalid scroll ID");
        return civicRegistry[id];
    }

    function totalLinked() public view returns (uint) {
        return linkedCount;
    }
}
