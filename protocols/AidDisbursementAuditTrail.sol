// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidDisbursementAuditTrail {
    address public steward;

    struct Disbursement {
        string beneficiaryID;
        uint256 amount;
        string aidType;
        string disbursementDate;
        string channel;
    }

    Disbursement[] public trail;

    event AidDisbursed(string beneficiaryID, uint256 amount, string aidType, string disbursementDate, string channel);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDisbursement(
        string memory beneficiaryID,
        uint256 amount,
        string memory aidType,
        string memory disbursementDate,
        string memory channel
    ) public onlySteward {
        trail.push(Disbursement(beneficiaryID, amount, aidType, disbursementDate, channel));
        emit AidDisbursed(beneficiaryID, amount, aidType, disbursementDate, channel);
    }
}
