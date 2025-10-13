// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BPOResilienceChoreographyDAO {
    address public steward;

    struct ResilienceEvent {
        string companyName;
        string purok;
        string resilienceAction; // "Remote Shift", "Wage Buffer", "Mental Health Support"
        string threatTrigger; // "Tariff", "Legislation", "Currency Shock"
        string emotionalTag;
        uint256 timestamp;
    }

    ResilienceEvent[] public events;

    event ResilienceLogged(
        string companyName,
        string purok,
        string resilienceAction,
        string threatTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log BPO resilience rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logResilience(
        string memory companyName,
        string memory purok,
        string memory resilienceAction,
        string memory threatTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ResilienceEvent({
            companyName: companyName,
            purok: purok,
            resilienceAction: resilienceAction,
            threatTrigger: threatTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ResilienceLogged(companyName, purok, resilienceAction, threatTrigger, emotionalTag, block.timestamp);
    }

    function getResilienceByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory purok,
        string memory resilienceAction,
        string memory threatTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ResilienceEvent memory r = events[index];
        return (
            r.companyName,
            r.purok,
            r.resilienceAction,
            r.threatTrigger,
            r.emotionalTag,
            r.timestamp
        );
    }
}
