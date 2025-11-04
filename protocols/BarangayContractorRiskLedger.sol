// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayContractorRiskLedger {
    address public steward;

    struct RiskEntry {
        string contractorName;
        string barangay;
        string riskSignal;
        string emotionalTag;
    }

    RiskEntry[] public ledger;

    event ContractorRiskTagged(string contractorName, string barangay, string riskSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRisk(
        string memory contractorName,
        string memory barangay,
        string memory riskSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RiskEntry(contractorName, barangay, riskSignal, emotionalTag));
        emit ContractorRiskTagged(contractorName, barangay, riskSignal, emotionalTag);
    }
}
