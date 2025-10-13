// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IlliquidAssetDeferralCharterDAO {
    address public steward;

    struct DeferralEvent {
        string assetType; // "Farm", "Business", "Land"
        string deferralTrigger; // "Unrealised Gain", "Liquidity Risk"
        string deferralStatus; // "Granted", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    DeferralEvent[] public events;

    event DeferralLogged(
        string assetType,
        string deferralTrigger,
        string deferralStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log illiquid asset deferral rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDeferral(
        string memory assetType,
        string memory deferralTrigger,
        string memory deferralStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DeferralEvent({
            assetType: assetType,
            deferralTrigger: deferralTrigger,
            deferralStatus: deferralStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DeferralLogged(assetType, deferralTrigger, deferralStatus, emotionalTag, block.timestamp);
    }

    function getDeferralByIndex(uint256 index) external view returns (
        string memory assetType,
        string memory deferralTrigger,
        string memory deferralStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DeferralEvent memory d = events[index];
        return (
            d.assetType,
            d.deferralTrigger,
            d.deferralStatus,
            d.emotionalTag,
            d.timestamp
        );
    }
}
