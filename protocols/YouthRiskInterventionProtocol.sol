// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthRiskInterventionProtocol {
    address public admin;

    struct InterventionEntry {
        string district;
        string riskType; // "Jumper Theft", "Street Exposure", "Cargo Targeting"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool intervened;
        bool sealed;
    }

    InterventionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIntervention(string memory district, string memory riskType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(InterventionEntry(district, riskType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmIntervention(uint256 index) external onlyAdmin {
        entries[index].intervened = true;
    }

    function sealInterventionEntry(uint256 index) external onlyAdmin {
        require(entries[index].intervened, "Must be intervened first");
        entries[index].sealed = true;
    }

    function getInterventionEntry(uint256 index) external view returns (InterventionEntry memory) {
        return entries[index];
    }
}
