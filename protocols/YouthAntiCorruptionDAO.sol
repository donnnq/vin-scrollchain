// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthAntiCorruptionDAO {
    address public admin;

    struct CaseEntry {
        string caseName;
        string region;
        string corruptionType;
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sealed;
    }

    CaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCase(string memory caseName, string memory region, string memory corruptionType, string memory emotionalTag) external onlyAdmin {
        entries.push(CaseEntry(caseName, region, corruptionType, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealCaseEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getCaseEntry(uint256 index) external view returns (CaseEntry memory) {
        return entries[index];
    }
}
