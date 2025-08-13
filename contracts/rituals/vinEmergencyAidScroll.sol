// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinEmergencyAidScroll {
    struct AidRequest {
        string workerName;
        string reason;
        uint256 amount;
        bool approved;
        bool repaid;
        uint256 timestamp;
    }

    mapping(address => AidRequest[]) public aidLedger;

    event AidRequested(address indexed worker, string reason, uint256 amount);
    event AidApproved(address indexed worker, uint256 amount);
    event AidRepaid(address indexed worker, uint256 amount);

    function requestAid(address worker, string memory name, string memory reason, uint256 amount) public {
        aidLedger[worker].push(AidRequest(name, reason, amount, false, false, block.timestamp));
        emit AidRequested(worker, reason, amount);
    }

    function approveAid(address worker, uint index) public {
        AidRequest storage r = aidLedger[worker][index];
        require(!r.approved, "Already approved.");
        r.approved = true;
        emit AidApproved(worker, r.amount);
    }

    function logRepayment(address worker, uint index) public {
        AidRequest storage r = aidLedger[worker][index];
        require(r.approved, "Aid not approved.");
        require(!r.repaid, "Already repaid.");
        r.repaid = true;
        emit AidRepaid(worker, r.amount);
    }

    function getAidHistory(address worker) public view returns (AidRequest[] memory) {
        return aidLedger[worker];
    }
}
