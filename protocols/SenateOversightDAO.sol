// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateOversightDAO {
    address public admin;

    struct OversightEntry {
        string committeeName;
        string chairAffiliation; // "Majority", "Minority", "Independent"
        string oversightClause;
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

    function summonOversight(string memory committeeName, string memory chairAffiliation, string memory oversightClause, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(committeeName, chairAffiliation, oversightClause, emotionalTag, true, false, false));
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
