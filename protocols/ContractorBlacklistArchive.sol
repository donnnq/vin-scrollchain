// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorBlacklistArchive {
    address public admin;

    struct BlacklistEntry {
        string contractorName; // "XYZ Builders Inc."
        string violationType; // "Ghost project", "Overpricing", "Delayed implementation"
        string blacklistSignal; // "DOJ referral", "COA audit", "Senate resolution"
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    BlacklistEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveBlacklist(string memory contractorName, string memory violationType, string memory blacklistSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BlacklistEntry(contractorName, violationType, blacklistSignal, emotionalTag, true, false));
    }

    function sealBlacklistEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getBlacklistEntry(uint256 index) external view returns (BlacklistEntry memory) {
        return entries[index];
    }
}
