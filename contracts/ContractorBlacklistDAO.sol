// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorBlacklistDAO {
    address public admin;

    struct BlacklistEntry {
        string contractorName;
        string violationType;
        string emotionalTag;
        bool flagged;
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

    function flagContractor(string memory contractorName, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(BlacklistEntry(contractorName, violationType, emotionalTag, true, false));
    }

    function blacklistContractor(uint256 index) external onlyAdmin {
        entries[index].blacklisted = true;
    }

    function getBlacklist(uint256 index) external view returns (BlacklistEntry memory) {
        return entries[index];
    }
}
