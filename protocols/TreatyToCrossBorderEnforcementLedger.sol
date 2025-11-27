// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCrossBorderEnforcementLedger {
    string public batchID = "1321.9.158";
    string public steward = "Vinvin";

    address public admin;

    struct Enforcement {
        string originCourt;
        string targetCourt;
        string caseDetail;
        bool enforced;
        uint256 timestamp;
    }

    Enforcement[] public enforcements;

    event EnforcementLogged(string originCourt, string targetCourt, string caseDetail);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEnforcement(string memory originCourt, string memory targetCourt, string memory caseDetail, bool enforced) public onlyAdmin {
        enforcements.push(Enforcement(originCourt, targetCourt, caseDetail, enforced, block.timestamp));
        emit EnforcementLogged(originCourt, targetCourt, caseDetail);
    }

    function getEnforcement(uint256 index) public view returns (string memory originCourt, string memory targetCourt, string memory caseDetail, bool enforced, uint256 timestamp) {
        Enforcement memory e = enforcements[index];
        return (e.originCourt, e.targetCourt, e.caseDetail, e.enforced, e.timestamp);
    }
}
