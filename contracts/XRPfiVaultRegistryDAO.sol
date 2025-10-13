// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract XRPfiVaultRegistryDAO {
    address public steward;

    struct VaultEvent {
        string assetType; // "XRP", "RLUSD", "wBTC"
        string strategyType; // "Liquid Staking", "Lending", "Yield Aggregation"
        string vaultStatus; // "Active", "Pending", "Deprecated"
        string emotionalTag;
        uint256 timestamp;
    }

    VaultEvent[] public events;

    event VaultLogged(
        string assetType,
        string strategyType,
        string vaultStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log XRPfi vault rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logVault(
        string memory assetType,
        string memory strategyType,
        string memory vaultStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(VaultEvent({
            assetType: assetType,
            strategyType: strategyType,
            vaultStatus: vaultStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit VaultLogged(assetType, strategyType, vaultStatus, emotionalTag, block.timestamp);
    }

    function getVaultByIndex(uint256 index) external view returns (
        string memory assetType,
        string memory strategyType,
        string memory vaultStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        VaultEvent memory v = events[index];
        return (
            v.assetType,
            v.strategyType,
            v.vaultStatus,
            v.emotionalTag,
            v.timestamp
        );
    }
}
