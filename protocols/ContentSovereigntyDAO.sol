// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContentSovereigntyDAO {
    address public admin;

    struct IncidentEntry {
        string location;
        string disruptionType;
        string culturalClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    IncidentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIncident(string memory location, string memory disruptionType, string memory culturalClause, string memory emotionalTag) external onlyAdmin {
        entries.push(IncidentEntry(location, disruptionType, culturalClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealIncidentEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getIncidentEntry(uint256 index) external view returns (IncidentEntry memory) {
        return entries[index];
    }
}
