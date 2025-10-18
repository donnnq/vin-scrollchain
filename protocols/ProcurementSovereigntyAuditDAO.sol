// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementSovereigntyAuditDAO {
    address public admin;

    struct ContractorEntry {
        string companyName;
        string project;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool banned;
    }

    ContractorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonContractor(string memory companyName, string memory project, string memory emotionalTag) external onlyAdmin {
        entries.push(ContractorEntry(companyName, project, emotionalTag, true, false, false));
    }

    function flagForBreach(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function banContractor(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].banned = true;
    }

    function getContractorEntry(uint256 index) external view returns (ContractorEntry memory) {
        return entries[index];
    }
}
