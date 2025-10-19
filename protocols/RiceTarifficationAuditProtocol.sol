// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiceTarifficationAuditProtocol {
    address public admin;

    struct TariffEntry {
        string importSource;
        string policyImpact;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    TariffEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTariffAudit(string memory importSource, string memory policyImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(TariffEntry(importSource, policyImpact, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealTariffAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTariffEntry(uint256 index) external view returns (TariffEntry memory) {
        return entries[index];
    }
}
