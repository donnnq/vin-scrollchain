// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title DepositorProtectionProtocol
/// @notice Immortalizes breach events, depositor grief, and restoration actions
/// @dev Anchors validator-grade banking consequence mapping and insurance clauses

contract DepositorProtectionProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct BreachEvent {
        uint256 id;
        address depositor;
        string bankName; // e.g., "BDO", "Metrobank"
        string breachTrigger; // e.g., "Unauthorized OTP reset", "Device compromise"
        string emotionalTag; // e.g., "Depositor grief mapped", "Trust breach ritualized"
        string restorationAction; // e.g., "Funds reimbursed", "Security protocol upgraded"
        string insuranceClause; // e.g., "PDIC coverage confirmed", "Regulatory audit initiated"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => BreachEvent> public events;

    event ValidatorSet(address indexed account, bool status);
    event BreachEventTagged(uint256 indexed id, address indexed depositor, string bankName);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagBreachEvent(
        string calldata bankName,
        string calldata breachTrigger,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata insuranceClause
    ) external returns (uint256 id) {
        id = nextId++;
        events[id] = BreachEvent({
            id: id,
            depositor: msg.sender,
            bankName: bankName,
            breachTrigger: breachTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            insuranceClause: insuranceClause,
            timestamp: block.timestamp
        });
        emit BreachEventTagged(id, msg.sender, bankName);
    }

    function getBreachEvent(uint256 id) external view returns (BreachEvent memory) {
        return events[id];
    }
}
