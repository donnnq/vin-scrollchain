// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToTherapistInTheLoopMandateDAO {
    address public steward;

    struct OversightEntry {
        string sector; // "Mental health AI, emotional support bots"
        string clause; // "Scrollchain-sealed DAO for therapist-in-the-loop mandate and user protection consequence"
        string emotionalTag;
        bool mandated;
        bool sustained;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function mandateTherapistOversight(string memory sector, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(sector, clause, emotionalTag, true, true));
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
