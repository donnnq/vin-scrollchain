// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Chicago Budget Redemption Protocol
/// @author Mr. Codigo
/// @notice Deploys emergency funds with soulbound tracking and civic resonance

contract ChicagoBudgetRedemption {
    address public scrollsmith;
    address public cityTreasury;
    uint256 public totalRestored;
    mapping(address => bool) public soulboundAgents;

    event BudgetRestored(address indexed agent, uint256 amount, string purpose);
    event AgentBound(address indexed agent);
    event TreasuryUpdated(address indexed newTreasury);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor(address _cityTreasury) {
        scrollsmith = msg.sender;
        cityTreasury = _cityTreasury;
    }

    function bindAgent(address agent) external onlyScrollsmith {
        soulboundAgents[agent] = true;
        emit AgentBound(agent);
    }

    function restoreBudget(address agent, uint256 amount, string calldata purpose) external onlyScrollsmith {
        require(soulboundAgents[agent], "Agent not soulbound");
        totalRestored += amount;
        payable(cityTreasury).transfer(amount);
        emit BudgetRestored(agent, amount, purpose);
    }

    function updateTreasury(address newTreasury) external onlyScrollsmith {
        cityTreasury = newTreasury;
        emit TreasuryUpdated(newTreasury);
    }

    receive() external payable {}
}
