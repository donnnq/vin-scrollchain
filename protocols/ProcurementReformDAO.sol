// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementReformDAO {
    address public admin;

    struct ReformEntry {
        string agencyName;
        string procurementType;
        string reformClause;
        string emotionalTag;
        bool summoned;
        bool implemented;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReform(string memory agencyName, string memory procurementType, string memory reformClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReformEntry(agencyName, procurementType, reformClause, emotionalTag, true, false, false));
    }

    function confirmImplementation(uint256 index) external onlyAdmin {
        entries[index].implemented = true;
    }

    function sealReformEntry(uint256 index) external onlyAdmin {
        require(entries[index].implemented, "Must be implemented first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
