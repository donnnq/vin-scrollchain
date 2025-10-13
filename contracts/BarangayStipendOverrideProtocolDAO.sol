// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayStipendOverrideProtocolDAO {
    address public steward;

    struct OverrideEvent {
        string barangayName;
        string overrideTrigger; // "Delayed Disbursement", "Untracked Ledger", "Missing Allocation"
        uint256 overrideAmount;
        string overrideStatus; // "Deployed", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    OverrideEvent[] public events;

    event OverrideLogged(
        string barangayName,
        string overrideTrigger,
        uint256 overrideAmount,
        string overrideStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log barangay stipend overrides");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logOverride(
        string memory barangayName,
        string memory overrideTrigger,
        uint256 overrideAmount,
        string memory overrideStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(OverrideEvent({
            barangayName: barangayName,
            overrideTrigger: overrideTrigger,
            overrideAmount: overrideAmount,
            overrideStatus: overrideStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit OverrideLogged(barangayName, overrideTrigger, overrideAmount, overrideStatus, emotionalTag, block.timestamp);
    }

    function getOverrideByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory overrideTrigger,
        uint256 overrideAmount,
        string memory overrideStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        OverrideEvent memory o = events[index];
        return (
            o.barangayName,
            o.overrideTrigger,
            o.overrideAmount,
            o.overrideStatus,
            o.emotionalTag,
            o.timestamp
        );
    }
}
