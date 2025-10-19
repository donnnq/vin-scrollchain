// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MotionForReconsiderationCodex {
    address public admin;

    struct MotionEntry {
        string entityName;
        string caseReference;
        string justification;
        string emotionalTag;
        bool summoned;
        bool filed;
        bool sealed;
    }

    MotionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMotion(string memory entityName, string memory caseReference, string memory justification, string memory emotionalTag) external onlyAdmin {
        entries.push(MotionEntry(entityName, caseReference, justification, emotionalTag, true, false, false));
    }

    function confirmFiling(uint256 index) external onlyAdmin {
        entries[index].filed = true;
    }

    function sealMotionEntry(uint256 index) external onlyAdmin {
        require(entries[index].filed, "Must be filed first");
        entries[index].sealed = true;
    }

    function getMotionEntry(uint256 index) external view returns (MotionEntry memory) {
        return entries[index];
    }
}
