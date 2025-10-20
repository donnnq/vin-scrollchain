// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorBlacklistCodex {
    address public admin;

    struct BlacklistEntry {
        string contractorName;
        string violationType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool blacklisted;
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

    function summonBlacklist(string memory contractorName, string memory violationType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BlacklistEntry(contractorName, violationType, auditClause, emotionalTag, true, false, false));
    }

    function confirmBlacklist(uint256 index) external onlyAdmin {
        entries[index].blacklisted = true;
    }

    function sealBlacklistEntry(uint256 index) external onlyAdmin {
        require(entries[index].blacklisted, "Must be blacklisted first");
        entries[index].sealed = true;
    }

    function getBlacklistEntry(uint256 index) external view returns (BlacklistEntry memory) {
        return entries[index];
    }
}
