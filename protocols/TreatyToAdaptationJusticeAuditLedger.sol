// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAdaptationJusticeAuditLedger {
    string public batchID = "1321.9.234";
    string public steward = "Vinvin";

    address public admin;

    struct Adaptation {
        string project;     // flood defenses, renewable transition, reforestation
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Adaptation[] public adaptations;

    event AdaptationLogged(string project, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAdaptation(string memory project, string memory status) public onlyAdmin {
        adaptations.push(Adaptation(project, status, block.timestamp));
        emit AdaptationLogged(project, status);
    }

    function getAdaptation(uint256 index) public view returns (string memory project, string memory status, uint256 timestamp) {
        Adaptation memory a = adaptations[index];
        return (a.project, a.status, a.timestamp);
    }
}
