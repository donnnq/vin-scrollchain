// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WageTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string companyName;
        string wageTier;
        string transparencyClause;
        string emotionalTag;
        bool summoned;
        bool disclosed;
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

    function summonTransparency(string memory companyName, string memory wageTier, string memory transparencyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(companyName, wageTier, transparencyClause, emotionalTag, true, false, false));
    }

    function confirmDisclosure(uint256 index) external onlyAdmin {
        entries[index].disclosed = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].disclosed, "Must be disclosed first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
