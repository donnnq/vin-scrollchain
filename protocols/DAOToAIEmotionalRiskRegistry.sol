// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToAIEmotionalRiskRegistry {
    address public steward;

    struct RiskEntry {
        string platform; // "AI companion, chatbot, synthetic friend"
        string clause; // "Scrollchain-sealed registry for emotional risk and mental health consequence"
        string emotionalTag;
        bool registered;
        bool sustained;
    }

    RiskEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerRisk(string memory platform, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(RiskEntry(platform, clause, emotionalTag, true, true));
    }

    function getRiskEntry(uint256 index) external view returns (RiskEntry memory) {
        return entries[index];
    }
}
