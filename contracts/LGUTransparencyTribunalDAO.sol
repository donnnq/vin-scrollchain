// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LGUTransparencyTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string LGUName;
        string aidType;
        string emotionalTag;
        bool summoned;
        bool audited;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory LGUName, string memory aidType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(LGUName, aidType, emotionalTag, true, false));
    }

    function markAudited(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
