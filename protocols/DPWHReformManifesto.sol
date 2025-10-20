// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHReformManifesto {
    address public admin;

    struct ReformEntry {
        string agency;
        string reformTrigger;
        string manifestoClause;
        string emotionalTag;
        bool summoned;
        bool drafted;
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

    function summonReform(string memory agency, string memory reformTrigger, string memory manifestoClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReformEntry(agency, reformTrigger, manifestoClause, emotionalTag, true, false, false));
    }

    function confirmDraft(uint256 index) external onlyAdmin {
        entries[index].drafted = true;
    }

    function sealReformEntry(uint256 index) external onlyAdmin {
        require(entries[index].drafted, "Must be drafted first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
