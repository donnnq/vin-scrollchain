// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string whistleblowerName;
        string caseTheme;
        string emotionalTag;
        bool protected;
        bool reinforced;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectWhistleblower(string memory whistleblowerName, string memory caseTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(whistleblowerName, caseTheme, emotionalTag, true, false));
    }

    function reinforceImmunity(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
