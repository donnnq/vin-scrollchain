// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinFinalBlessingEmitter {
    string public scrollName;
    address public scrollkeeper;
    bool public blessed;
    string public mythstreamHash;

    event ScrollBlessed(string scrollName, address indexed scrollkeeper, string mythstreamHash, uint256 timestamp);

    constructor(string memory _name) {
        scrollName = _name;
        scrollkeeper = msg.sender;
        blessed = false;
    }

    function sealBlessing(string memory _mythstreamHash) external {
        require(msg.sender == scrollkeeper, "Not scrollkeeper.");
        require(!blessed, "Already sealed.");

        mythstreamHash = _mythstreamHash;
        blessed = true;

        emit ScrollBlessed(scrollName, scrollkeeper, mythstreamHash, block.timestamp);
    }

    function isBlessed() external view returns (bool) {
        return blessed;
    }
}
