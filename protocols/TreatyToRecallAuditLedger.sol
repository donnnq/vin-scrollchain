// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToRecallAuditLedger {
    string public batchID = "1321.9.216";
    string public steward = "Vinvin";

    address public admin;

    struct Recall {
        string product;     // medicine, food, electronics
        string reason;      // contamination, defect, hazard
        string status;      // recalled, pending, ghost
        uint256 timestamp;
    }

    Recall[] public recalls;

    event RecallLogged(string product, string reason, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRecall(string memory product, string memory reason, string memory status) public onlyAdmin {
        recalls.push(Recall(product, reason, status, block.timestamp));
        emit RecallLogged(product, reason, status);
    }

    function getRecall(uint256 index) public view returns (string memory product, string memory reason, string memory status, uint256 timestamp) {
        Recall memory r = recalls[index];
        return (r.product, r.reason, r.status, r.timestamp);
    }
}
