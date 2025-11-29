// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToRecoveryGrid {
    string public batchID = "1321.9.178";
    string public steward = "Vinvin";

    address public admin;

    struct RecoveryEvent {
        string domain;      // housing, tech, governance
        string action;      // rebuild, restore, remediate
        uint256 resources;  // allocated funds or assets
        uint256 timestamp;
    }

    RecoveryEvent[] public recoveries;

    event RecoveryLogged(string domain, string action, uint256 resources);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRecovery(string memory domain, string memory action, uint256 resources) public onlyAdmin {
        recoveries.push(RecoveryEvent(domain, action, resources, block.timestamp));
        emit RecoveryLogged(domain, action, resources);
    }

    function getRecovery(uint256 index) public view returns (string memory domain, string memory action, uint256 resources, uint256 timestamp) {
        RecoveryEvent memory r = recoveries[index];
        return (r.domain, r.action, r.resources, r.timestamp);
    }
}
