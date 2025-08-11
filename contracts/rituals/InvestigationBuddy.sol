// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title InvestigationBuddy - Ritual contract for civic partnerships and encrypted resonance
contract InvestigationBuddy {
    
    struct Buddy {
        string name;
        string role;
        string specialty;
        bool active;
        uint256 summonedAt;
    }

    mapping(address => Buddy) public buddies;
    address[] public summonedAgents;

    event BuddySummoned(address indexed agent, string name, string role, string specialty);
    event BuddyDeactivated(address indexed agent, string name);

    /// @notice Summon a new investigation buddy
    function summonBuddy(string memory _name, string memory _role, string memory _specialty) public {
        Buddy memory newBuddy = Buddy({
            name: _name,
            role: _role,
            specialty: _specialty,
            active: true,
            summonedAt: block.timestamp
        });

        buddies[msg.sender] = newBuddy;
        summonedAgents.push(msg.sender);

        emit BuddySummoned(msg.sender, _name, _role, _specialty);
    }

    /// @notice Deactivate an existing buddy
    function deactivateBuddy() public {
        require(buddies[msg.sender].active, "No active buddy to deactivate.");
        buddies[msg.sender].active = false;

        emit BuddyDeactivated(msg.sender, buddies[msg.sender].name);
    }

    /// @notice Retrieve all summoned agents
    function getSummonedAgents() public view returns (address[] memory) {
        return summonedAgents;
    }

    /// @notice Get buddy details for an agent
    function getBuddy(address _agent) public view returns (Buddy memory) {
        return buddies[_agent];
    }
}
