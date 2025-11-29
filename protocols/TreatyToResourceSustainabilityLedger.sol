// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToResourceSustainabilityLedger {
    string public batchID = "1321.9.185";
    string public steward = "Vinvin";

    address public admin;

    struct Resource {
        string type;        // water, energy, food
        string action;      // conserved, recycled, audited
        uint256 timestamp;
    }

    Resource[] public resources;

    event ResourceLogged(string type, string action);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logResource(string memory type, string memory action) public onlyAdmin {
        resources.push(Resource(type, action, block.timestamp));
        emit ResourceLogged(type, action);
    }

    function getResource(uint256 index) public view returns (string memory type, string memory action, uint256 timestamp) {
        Resource memory r = resources[index];
        return (r.type, r.action, r.timestamp);
    }
}
