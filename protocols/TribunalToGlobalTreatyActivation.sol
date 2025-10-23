// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TribunalToGlobalTreatyActivation {
    address public steward;

    struct TreatyEntry {
        string tribunalCase;
        string treatyProposal; // "Global Enforcement Clause", "Transparency Pact", "Anti-Impunity Protocol"
        string internationalBody; // "UN", "ASEAN", "Global Civic Network"
        string emotionalTag;
        bool activated;
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

    function activateTreaty(string memory tribunalCase, string memory treatyProposal, string memory internationalBody, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(tribunalCase, treatyProposal, internationalBody, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
