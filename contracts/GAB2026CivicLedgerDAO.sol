// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GAB2026CivicLedgerDAO {
    address public steward;

    struct BudgetEvent {
        string department;
        uint256 allocationAmount;
        string purpose;
        string emotionalTag;
        uint256 timestamp;
    }

    BudgetEvent[] public events;

    event BudgetLogged(
        string department,
        uint256 allocationAmount,
        string purpose,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log civic budget rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBudget(
        string memory department,
        uint256 allocationAmount,
        string memory purpose,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BudgetEvent({
            department: department,
            allocationAmount: allocationAmount,
            purpose: purpose,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BudgetLogged(department, allocationAmount, purpose, emotionalTag, block.timestamp);
    }

    function getBudgetByIndex(uint256 index) external view returns (
        string memory department,
        uint256 allocationAmount,
        string memory purpose,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BudgetEvent memory b = events[index];
        return (
            b.department,
            b.allocationAmount,
            b.purpose,
            b.emotionalTag,
            b.timestamp
        );
    }
}
