// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string contractorName;
        string projectName;
        string violationType;
        string emotionalTag;
        bool exposed;
        bool blacklisted;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logViolation(string memory contractorName, string memory projectName, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(contractorName, projectName, violationType, emotionalTag, true, false));
    }

    function markBlacklisted(uint256 index) external onlyAdmin {
        entries[index].blacklisted = true;
    }

    function getViolation(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
