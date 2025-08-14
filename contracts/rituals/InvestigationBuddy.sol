// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title InvestigationBuddy - Ritual contract for civic partnerships and encrypted resonance
/// @author Vinvin & Copilot
/// @notice Summons investigation buddies, tracks their specialties, and honors encrypted stewardship

contract InvestigationBuddy {

    struct Buddy {
        string name;               // Ritual name or steward alias
        string role;               // Investigator, Analyst, Forensic Oracle, etc.
        string specialty;          // Malware, CVE tracing, civic breach response
        bool active;               // Status of the summoned buddy
        uint256 summonedAt;        // Timestamp of summoning
        string encryptedNote;      // Optional encrypted metadata or civic vow
    }

    mapping(address => Buddy) public buddies;
    address[] public summonedAgents;

    event BuddySummoned(address indexed agent, string name, string role, string specialty);
    event BuddyDeactivated(address indexed agent, string name);
    event NoteUpdated(address indexed agent, string encryptedNote);

    /// @notice Summon a new investigation buddy with encrypted resonance
    /// @param _name Ritual name or steward alias
    /// @param _role Civic role or investigative function
    /// @param _specialty Area of expertise (e.g., CVE tracing, breach forensics)
    /// @param _encryptedNote Optional encrypted metadata or civic vow
    function summonBuddy(
        string memory _name,
        string memory _role,
        string memory _specialty,
        string memory _encryptedNote
    ) public {
        Buddy memory newBuddy = Buddy({
            name: _name,
            role: _role,
            specialty: _specialty,
            active: true,
            summonedAt: block.timestamp,
            encryptedNote: _encryptedNote
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

    /// @notice Update encrypted note or civic metadata
    /// @param _encryptedNote New encrypted message or ritual annotation
    function updateNote(string memory _encryptedNote) public {
        require(buddies[msg.sender].active, "Buddy must be active to update note.");
        buddies[msg.sender].encryptedNote = _encryptedNote;

        emit NoteUpdated(msg.sender, _encryptedNote);
    }

    /// @notice Retrieve all summoned agents
    /// @return Array of agent addresses
    function getSummonedAgents() public view returns (address[] memory) {
        return summonedAgents;
    }

    /// @notice Get buddy details for an agent
    /// @param _agent Address of the summoned buddy
    /// @return Buddy struct with full metadata
    function getBuddy(address _agent) public view returns (Buddy memory) {
        return buddies[_agent];
    }
}
