// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPrivacyComplianceLedger {
    string public batchID = "1321.9.173";
    string public steward = "Vinvin";

    address public admin;

    struct ComplianceAction {
        string measure;     // audit, reform, transparency
        string entity;      // company, agency
        uint256 timestamp;
    }

    ComplianceAction[] public actions;

    event ComplianceLogged(string measure, string entity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCompliance(string memory measure, string memory entity) public onlyAdmin {
        actions.push(ComplianceAction(measure, entity, block.timestamp));
        emit ComplianceLogged(measure, entity);
    }

    function getCompliance(uint256 index) public view returns (string memory measure, string memory entity, uint256 timestamp) {
        ComplianceAction memory c = actions[index];
        return (c.measure, c.entity, c.timestamp);
    }
}
