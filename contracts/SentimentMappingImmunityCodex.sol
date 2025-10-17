// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SentimentMappingImmunityCodex {
    address public admin;

    struct MappingEntry {
        string region;
        string emotionalSignal;
        string immunityProtocol;
        bool mapped;
        bool granted;
    }

    MappingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mapSentiment(string memory region, string memory emotionalSignal, string memory immunityProtocol) external onlyAdmin {
        entries.push(MappingEntry(region, emotionalSignal, immunityProtocol, true, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getMappingEntry(uint256 index) external view returns (MappingEntry memory) {
        return entries[index];
    }
}
