// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GigToLaborRightsProtocol {
    address public steward;

    struct RightsEntry {
        string platform; // "Shopee, Lazada"
        string missingBenefit; // "No holidays, sick days, insurance"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonRightsAudit(string memory platform, string memory missingBenefit, string memory emotionalTag) external onlySteward {
        entries.push(RightsEntry(platform, missingBenefit, emotionalTag, true, false));
    }

    function sealRightsEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
