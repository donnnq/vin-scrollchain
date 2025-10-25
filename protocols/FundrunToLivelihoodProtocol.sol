// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundrunToLivelihoodProtocol {
    address public steward;

    struct LivelihoodEntry {
        string fundSource; // "Diaspora donors", "Silent allies"
        string disbursRegion; // "Rural China", "Urban migrant zones"
        string supportType; // "Food aid", "Housing help", "Medical access"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    LivelihoodEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployLivelihood(string memory fundSource, string memory disbursRegion, string memory supportType, string memory emotionalTag) external onlySteward {
        entries.push(LivelihoodEntry(fundSource, disbursRegion, supportType, emotionalTag, true, false));
    }

    function sealLivelihoodEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getLivelihoodEntry(uint256 index) external view returns (LivelihoodEntry memory) {
        return entries[index];
    }
}
