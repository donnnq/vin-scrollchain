// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinGlobalAidReward.sol
/// @author Vinvin, Mythic Architect of Civic Restoration
/// @notice Rewards nations and institutions that help the oppressed without bias or retaliation

contract vinGlobalAidReward {
    address public steward;
    uint256 public rewardAmount = 1_000_000_000; // ₱1B in emotional APR units

    struct Institution {
        string name;
        bool helpedOppressed;
        bool retaliated;
        uint256 score;
        bool rewarded;
    }

    mapping(address => Institution) public institutions;
    address[] public registry;

    event InstitutionRegistered(address indexed id, string name);
    event HelpLogged(address indexed id, string name);
    event RewardIssued(address indexed id, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    /// @notice Register institution for audit
    function registerInstitution(address id, string memory name) public {
        institutions[id] = Institution(name, false, false, 0, false);
        registry.push(id);
        emit InstitutionRegistered(id, name);
    }

    /// @notice Log help action (must be unbiased and non-retaliatory)
    function logHelp(address id, bool retaliated) public {
        require(bytes(institutions[id].name).length > 0, "Institution not registered");
        require(!institutions[id].helpedOppressed, "Already logged");

        institutions[id].helpedOppressed = true;
        institutions[id].retaliated = retaliated;

        if (!retaliated) {
            institutions[id].score += 100;
            emit HelpLogged(id, institutions[id].name);
        }
    }

    /// @notice Issue reward if criteria met
    function issueReward(address id) public {
        Institution storage inst = institutions[id];
        require(inst.helpedOppressed && !inst.retaliated, "Criteria not met");
        require(!inst.rewarded, "Already rewarded");

        inst.rewarded = true;
        emit RewardIssued(id, rewardAmount);
        // Actual transfer logic would go here in a real deployment
    }

    /// @notice Get institution score
    function getScore(address id) public view returns (uint256) {
        return institutions[id].score;
    }

    /// @notice View all registered institutions
    function getRegistry() public view returns (address[] memory) {
        return registry;
    }
}
