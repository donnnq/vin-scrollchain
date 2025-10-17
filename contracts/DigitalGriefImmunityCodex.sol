// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalGriefImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string vaultName;
        string traumaType;
        string emotionalTag;
        bool documented;
        bool healed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logImmunity(string memory vaultName, string memory traumaType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(vaultName, traumaType, emotionalTag, true, false));
    }

    function markHealed(uint256 index) external onlyAdmin {
        entries[index].healed = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
