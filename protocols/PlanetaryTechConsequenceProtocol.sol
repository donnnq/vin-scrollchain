// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryTechConsequenceProtocol {
    address public admin;

    struct ConsequenceEntry {
        string innovationName;
        string consequenceType;
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConsequence(string memory innovationName, string memory consequenceType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ConsequenceEntry(innovationName, consequenceType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmAcknowledgement(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealConsequenceEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
