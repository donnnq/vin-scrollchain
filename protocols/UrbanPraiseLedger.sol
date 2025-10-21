// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanPraiseLedger {
    address public admin;

    struct PraiseEntry {
        string location;
        string praiseType; // "Mayor Applause", "Design Admiration", "International Comparison"
        string commentSource;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    PraiseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPraise(string memory location, string memory praiseType, string memory commentSource, string memory emotionalTag) external onlyAdmin {
        entries.push(PraiseEntry(location, praiseType, commentSource, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealPraiseEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getPraiseEntry(uint256 index) external view returns (PraiseEntry memory) {
        return entries[index];
    }
}
