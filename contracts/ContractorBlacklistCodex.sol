// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorBlacklistCodex {
    address public admin;

    struct BlacklistEntry {
        string contractorName;
        string violationDetail;
        string emotionalTag;
        bool blacklisted;
    }

    BlacklistEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contractorName, string memory violationDetail, string memory emotionalTag) external onlyAdmin {
        entries.push(BlacklistEntry(contractorName, violationDetail, emotionalTag, false));
    }

    function blacklistEntry(uint256 index) external onlyAdmin {
        entries[index].blacklisted = true;
    }

    function getEntry(uint256 index) external view returns (BlacklistEntry memory) {
        return entries[index];
    }
}
