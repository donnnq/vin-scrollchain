// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SemiconductorJusticeCodexDAO {
    address public admin;

    struct ChipEntry {
        string chipType;
        string originCountry;
        string exportStatus;
        string emotionalTag;
        bool embargoed;
    }

    ChipEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logChip(string memory _chipType, string memory _originCountry, string memory _exportStatus, string memory _emotionalTag) external onlyAdmin {
        codex.push(ChipEntry(_chipType, _originCountry, _exportStatus, _emotionalTag, false));
    }

    function embargoChip(uint256 index) external onlyAdmin {
        codex[index].embargoed = true;
    }

    function getChip(uint256 index) external view returns (ChipEntry memory) {
        return codex[index];
    }
}
