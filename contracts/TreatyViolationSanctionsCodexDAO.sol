// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyViolationSanctionsCodexDAO {
    address public admin;

    struct SanctionEntry {
        string treatyName;
        string violatorEntity;
        string sanctionType;
        string emotionalTag;
        bool activated;
    }

    SanctionEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSanction(string memory _treatyName, string memory _violatorEntity, string memory _sanctionType, string memory _emotionalTag) external onlyAdmin {
        codex.push(SanctionEntry(_treatyName, _violatorEntity, _sanctionType, _emotionalTag, false));
    }

    function activateSanction(uint256 index) external onlyAdmin {
        codex[index].activated = true;
    }

    function getSanction(uint256 index) external view returns (SanctionEntry memory) {
        return codex[index];
    }
}
