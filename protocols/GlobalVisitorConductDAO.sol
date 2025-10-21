// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalVisitorConductDAO {
    address public admin;

    struct ConductEntry {
        string visitorOrigin;
        string hostCountry;
        string conductClause;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    ConductEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConduct(string memory visitorOrigin, string memory hostCountry, string memory conductClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ConductEntry(visitorOrigin, hostCountry, conductClause, emotionalTag, true, false, false));
    }

    function confirmAcknowledgement(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealConductEntry(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getConductEntry(uint256 index) external view returns (ConductEntry memory) {
        return entries[index];
    }
}
