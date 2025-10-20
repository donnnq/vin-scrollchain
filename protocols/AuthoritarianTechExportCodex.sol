// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuthoritarianTechExportCodex {
    address public admin;

    struct ExportEntry {
        string vendor;
        string toolName;
        string recipientCountry;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ExportEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExport(string memory vendor, string memory toolName, string memory recipientCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(ExportEntry(vendor, toolName, recipientCountry, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealExportEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getExportEntry(uint256 index) external view returns (ExportEntry memory) {
        return entries[index];
    }
}
