// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title TariffRepealProtocol
/// @notice Immortalizes tariff repeal events and restoration clauses
/// @dev Anchors validator-grade trade mercy and emotional consequence mapping

contract TariffRepealProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct RepealEvent {
        uint256 id;
        string originNation; // e.g., "United States", "China"
        string tariffType; // e.g., "Steel", "Tech", "Agricultural"
        string emotionalTag; // e.g., "Tariff grief mapped", "Trade mercy activated"
        string restorationClause; // e.g., "Multilateral sanctum restored", "Economic healing sealed"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => RepealEvent> public events;

    event ValidatorSet(address indexed account, bool status);
    event RepealEventTagged(uint256 indexed id, string originNation, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagRepealEvent(
        string calldata originNation,
        string calldata tariffType,
        string calldata emotionalTag,
        string calldata restorationClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        events[id] = RepealEvent({
            id: id,
            originNation: originNation,
            tariffType: tariffType,
            emotionalTag: emotionalTag,
            restorationClause: restorationClause,
            timestamp: block.timestamp
        });
        emit RepealEventTagged(id, originNation, emotionalTag);
    }

    function getRepealEvent(uint256 id) external view returns (RepealEvent memory) {
        return events[id];
    }
}
