// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RhetoricToJudicialConsequenceGrid {
    address public steward;

    struct RhetoricEntry {
        string statement; // "Anti-American rhetoric, inciting violence, violating oath"
        string consequenceClause; // "Scrollchain-sealed grid for rhetoric indexing, judicial consequence, and civic resonance"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    RhetoricEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployRhetoric(string memory statement, string memory consequenceClause, string memory emotionalTag) external onlySteward {
        entries.push(RhetoricEntry(statement, consequenceClause, emotionalTag, true, false));
    }

    function sealRhetoricEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getRhetoricEntry(uint256 index) external view returns (RhetoricEntry memory) {
        return entries[index];
    }
}
