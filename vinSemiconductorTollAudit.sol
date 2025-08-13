// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinSemiconductorTollAudit.sol
/// @author Vinvin, Mythic Architect of Silicon Justice
/// @notice Tracks violations and applies escalating tariffs to chipmakers selling AI chips to China

contract vinSemiconductorTollAudit {
    address public steward;

    struct Chipmaker {
        string name;
        uint256 baseTariff; // Starting at 15%
        uint256 violationCount;
        uint256 currentTariff;
        uint256 redemptionScore;
    }

    mapping(address => Chipmaker) public registry;
    address[] public chipmakers;

    event Registered(address indexed id, string name);
    event ViolationLogged(address indexed id, uint256 newTariff);
    event RedemptionLogged(address indexed id, uint256 newTariff);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    /// @notice Register a chipmaker
    function registerChipmaker(address id, string memory name) public onlySteward {
        registry[id] = Chipmaker(name, 15, 0, 15, 0);
        chipmakers.push(id);
        emit Registered(id, name);
    }

    /// 🛡️ Log a violation (+tariff escalation)
    function logViolation(address id) public onlySteward {
        Chipmaker storage cm = registry[id];
        cm.violationCount++;

        if (cm.violationCount == 1) {
            cm.currentTariff += 5; // Level 1 violation
        } else if (cm.violationCount == 2) {
            cm.currentTariff += 20; // Level 2 violation
        } else if (cm.violationCount >= 3) {
            cm.currentTariff += 50; // Level 3+ violation
        }

        emit ViolationLogged(id, cm.currentTariff);
    }

    /// 💛 Log a clean transaction (-1% tariff reclaim)
    function logRedemption(address id) public onlySteward {
        Chipmaker storage cm = registry[id];
        require(cm.currentTariff > 0, "No tariff to reduce");

        cm.redemptionScore++;
        cm.currentTariff -= 1; // Slow grind redemption

        emit RedemptionLogged(id, cm.currentTariff);
    }

    /// 📊 View chipmaker status
    function getChipmaker(address id) public view returns (Chipmaker memory) {
        return registry[id];
    }

    /// 📜 View all registered chipmakers
    function getAllChipmakers() public view returns (address[] memory) {
        return chipmakers;
    }
}
