// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FourPsInclusionProtocol {
    address public admin;

    struct InclusionEntry {
        string familyID;
        string purokID;
        string inclusionType;
        string emotionalTag;
        bool summoned;
        bool qualified;
        bool sealed;
    }

    InclusionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonInclusion(string memory familyID, string memory purokID, string memory inclusionType, string memory emotionalTag) external onlyAdmin {
        entries.push(InclusionEntry(familyID, purokID, inclusionType, emotionalTag, true, false, false));
    }

    function confirmQualification(uint256 index) external onlyAdmin {
        entries[index].qualified = true;
    }

    function sealInclusion(uint256 index) external onlyAdmin {
        require(entries[index].qualified, "Must be qualified first");
        entries[index].sealed = true;
    }

    function getInclusionEntry(uint256 index) external view returns (InclusionEntry memory) {
        return entries[index];
    }
}
