// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ShelterRebuildProgressLedger {
    address public validator;

    struct Rebuild {
        string location;
        string phase;
        string contractor;
        uint256 timestamp;
    }

    Rebuild[] public rebuilds;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logRebuild(string memory _location, string memory _phase, string memory _contractor) public onlyValidator {
        rebuilds.push(Rebuild(_location, _phase, _contractor, block.timestamp));
    }

    function getRebuild(uint256 index) public view returns (Rebuild memory) {
        return rebuilds[index];
    }

    function totalRebuilds() public view returns (uint256) {
        return rebuilds.length;
    }
}
