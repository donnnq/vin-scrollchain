// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SelfManagedFundImmunityProtocolDAO {
    address public steward;

    struct ImmunityEvent {
        string assetType; // "Farm", "Business", "Land"
        string liquidityRisk; // "Unrealised Gain", "Non-Cash Holding", "Delayed Sale"
        string immunityStatus; // "Granted", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    ImmunityEvent[] public events;

    event ImmunityLogged(
        string assetType,
        string liquidityRisk,
        string immunityStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log self-managed fund immunity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logImmunity(
        string memory assetType,
        string memory liquidityRisk,
        string memory immunityStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ImmunityEvent({
            assetType: assetType,
            liquidityRisk: liquidityRisk,
            immunityStatus: immunityStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ImmunityLogged(assetType, liquidityRisk, immunityStatus, emotionalTag, block.timestamp);
    }

    function getImmunityByIndex(uint256 index) external view returns (
        string memory assetType,
        string memory liquidityRisk,
        string memory immunityStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ImmunityEvent memory i = events[index];
        return (
            i.assetType,
            i.liquidityRisk,
            i.immunityStatus,
            i.emotionalTag,
            i.timestamp
        );
    }
}
