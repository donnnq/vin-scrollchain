// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnterpriseAIUsageRiskIndex {
    address public steward;

    struct RiskEntry {
        string timestamp;
        string organization;
        string extensionUsed;
        uint256 exposureScore;
        string mitigationStatus;
        string emotionalTag;
    }

    RiskEntry[] public index;

    event EnterpriseRiskIndexed(string timestamp, string organization, string extensionUsed, uint256 exposureScore, string mitigationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexRisk(
        string memory timestamp,
        string memory organization,
        string memory extensionUsed,
        uint256 exposureScore,
        string memory mitigationStatus,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RiskEntry(timestamp, organization, extensionUsed, exposureScore, mitigationStatus, emotionalTag));
        emit EnterpriseRiskIndexed(timestamp, organization, extensionUsed, exposureScore, mitigationStatus, emotionalTag);
    }
}
