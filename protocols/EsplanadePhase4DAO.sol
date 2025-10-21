// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadePhase4DAO {
    address public admin;

    struct PhaseEntry {
        string location;
        string phaseNumber;
        string featureType; // "Walkway", "Lighting", "River View Deck"
        string emotionalTag;
        bool summoned;
        bool opened;
        bool sealed;
    }

    PhaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPhase(string memory location, string memory phaseNumber, string memory featureType, string memory emotionalTag) external onlyAdmin {
        entries.push(PhaseEntry(location, phaseNumber, featureType, emotionalTag, true, false, false));
    }

    function confirmOpening(uint256 index) external onlyAdmin {
        entries[index].opened = true;
    }

    function sealPhaseEntry(uint256 index) external onlyAdmin {
        require(entries[index].opened, "Must be opened first");
        entries[index].sealed = true;
    }

    function getPhaseEntry(uint256 index) external view returns (PhaseEntry memory) {
        return entries[index];
    }
}
