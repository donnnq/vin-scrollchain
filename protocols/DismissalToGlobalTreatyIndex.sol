// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DismissalToGlobalTreatyIndex {
    address public steward;

    struct TreatyEntry {
        string respondent; // "Senator Joel Villanueva"
        string dismissalOrderDate;
        string treatyProposal; // "Anti-Impunity Protocol", "Global Enforcement Clause"
        string internationalBody; // "UN", "ASEAN", "Global Civic Network"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTreaty(string memory respondent, string memory dismissalOrderDate, string memory treatyProposal, string memory internationalBody, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(respondent, dismissalOrderDate, treatyProposal, internationalBody, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
