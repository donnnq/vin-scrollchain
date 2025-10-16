// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectiveJusticeImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string caseName;
        string protectedActor;
        string immunityType;
        string emotionalTag;
        bool documented;
        bool revoked;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logImmunity(string memory caseName, string memory protectedActor, string memory immunityType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(caseName, protectedActor, immunityType, emotionalTag, true, false));
    }

    function revokeImmunity(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
