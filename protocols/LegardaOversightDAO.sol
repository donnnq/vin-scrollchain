// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegardaOversightDAO {
    address public admin;

    struct OversightEntry {
        string senator;
        string agency;
        string budgetYear;
        string anomalyClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory senator, string memory agency, string memory budgetYear, string memory anomalyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(senator, agency, budgetYear, anomalyClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
