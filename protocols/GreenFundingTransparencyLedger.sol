// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenFundingTransparencyLedger {
    address public steward;

    struct FundingEntry {
        string projectName;
        string timestamp;
        uint256 amountReleased;
        string sourceAgency;
        string auditStatus;
        string emotionalTag;
    }

    FundingEntry[] public ledger;

    event FundingLogged(string projectName, string timestamp, uint256 amountReleased, string sourceAgency, string auditStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFunding(
        string memory projectName,
        string memory timestamp,
        uint256 amountReleased,
        string memory sourceAgency,
        string memory auditStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FundingEntry(projectName, timestamp, amountReleased, sourceAgency, auditStatus, emotionalTag));
        emit FundingLogged(projectName, timestamp, amountReleased, sourceAgency, auditStatus, emotionalTag);
    }
}
