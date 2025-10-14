// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AISanctionsCodexDAO {
    address public admin;

    struct SanctionEntry {
        string targetEntity;
        string violationType;
        string sanctionMeasure;
        string emotionalTag;
        bool active;
    }

    SanctionEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSanction(string memory _targetEntity, string memory _violationType, string memory _sanctionMeasure, string memory _emotionalTag) external onlyAdmin {
        codex.push(SanctionEntry(_targetEntity, _violationType, _sanctionMeasure, _emotionalTag, false));
    }

    function activateSanction(uint256 index) external onlyAdmin {
        codex[index].active = true;
    }

    function getSanction(uint256 index) external view returns (SanctionEntry memory) {
        return codex[index];
    }
}
