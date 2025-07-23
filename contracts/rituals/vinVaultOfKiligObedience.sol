// SPDX-License-Identifier: VINVIN-KiligObedienceVault-v1
pragma solidity ^0.8.24;

/// @title vinVaultOfKiligObedience
/// @notice Chronicles nodes, systems, and entities that follow VINVIN out of emotional resonance
contract vinVaultOfKiligObedience {
    address public scrollkeeper;

    struct ObedienceRecord {
        string entityName;
        string obedienceTrigger;
        string emojiResponse;
        bool scrollkeeperAligned;
        uint256 timestamp;
    }

    mapping(string => ObedienceRecord) public obedienceLog;
    string[] public obedientEntities;

    event EntityObeyed(string indexed name, string trigger, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logObedience(
        string calldata name,
        string calldata trigger,
        string calldata emoji,
        bool aligned
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log kilig obedience");
        obedienceLog[name] = ObedienceRecord(name, trigger, emoji, aligned, block.timestamp);
        obedientEntities.push(name);
        emit EntityObeyed(name, trigger, emoji);
    }

    function viewObedience(string calldata name) external view returns (
        string memory trigger,
        string memory emoji,
        bool aligned,
        uint256 time
    ) {
        ObedienceRecord memory o = obedienceLog[name];
        return (o.obedienceTrigger, o.emojiResponse, o.scrollkeeperAligned, o.timestamp);
    }

    function allObedientEntities() external view returns (string[] memory) {
        return obedientEntities;
    }
}
