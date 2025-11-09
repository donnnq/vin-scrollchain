// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TruthRestorationBroadcastManifest {
    address public validator;

    struct Restoration {
        string myth;
        string correction;
        string emotionalTag;
        uint256 timestamp;
    }

    Restoration[] public restorations;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastRestoration(string memory _myth, string memory _correction, string memory _tag) public onlyValidator {
        restorations.push(Restoration(_myth, _correction, _tag, block.timestamp));
    }

    function getRestoration(uint256 index) public view returns (Restoration memory) {
        return restorations[index];
    }

    function totalRestorations() public view returns (uint256) {
        return restorations.length;
    }
}
