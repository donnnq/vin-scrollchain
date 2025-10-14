// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChipExportImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string chipType;
        string destinationCountry;
        string exportBlockReason;
        string emotionalTag;
        bool enforced;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _chipType, string memory _destinationCountry, string memory _exportBlockReason, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_chipType, _destinationCountry, _exportBlockReason, _emotionalTag, false));
    }

    function enforceBlock(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
