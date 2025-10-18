// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtesterVisaAuditTribunalDAO {
    address public admin;

    struct ProtesterEntry {
        string name;
        string countryOrigin;
        string protestType;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool revoked;
        bool deported;
    }

    ProtesterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtester(string memory name, string memory countryOrigin, string memory protestType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtesterEntry(name, countryOrigin, protestType, emotionalTag, true, false, false, false));
    }

    function flagProtester(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function revokeVisa(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].revoked = true;
    }

    function deportProtester(uint256 index) external onlyAdmin {
        require(entries[index].revoked, "Must be revoked first");
        entries[index].deported = true;
    }

    function getProtesterEntry(uint256 index) external view returns (ProtesterEntry memory) {
        return entries[index];
    }
}
