// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CoopTaxExemptionDefenseDAO {
    address public steward;

    struct ExemptionEvent {
        string coopName;
        string exemptionType; // "Income Tax", "VAT", "Local Tax"
        string defenseTrigger; // "BIR Memo", "TIN Requirement", "Audit Flag"
        string exemptionStatus; // "Active", "Pending", "Revoked"
        string emotionalTag;
        uint256 timestamp;
    }

    ExemptionEvent[] public events;

    event ExemptionLogged(
        string coopName,
        string exemptionType,
        string defenseTrigger,
        string exemptionStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log coop tax exemption rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logExemption(
        string memory coopName,
        string memory exemptionType,
        string memory defenseTrigger,
        string memory exemptionStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ExemptionEvent({
            coopName: coopName,
            exemptionType: exemptionType,
            defenseTrigger: defenseTrigger,
            exemptionStatus: exemptionStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ExemptionLogged(coopName, exemptionType, defenseTrigger, exemptionStatus, emotionalTag, block.timestamp);
    }

    function getExemptionByIndex(uint256 index) external view returns (
        string memory coopName,
        string memory exemptionType,
        string memory defenseTrigger,
        string memory exemptionStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ExemptionEvent memory e = events[index];
        return (
            e.coopName,
            e.exemptionType,
            e.defenseTrigger,
            e.exemptionStatus,
            e.emotionalTag,
            e.timestamp
        );
    }
}
