// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string projectName;
        string oversightClause;
        string reformMilestone;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory projectName, string memory oversightClause, string memory reformMilestone, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(projectName, oversightClause, reformMilestone, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
