// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalAPRCodexDAO {
    address public admin;

    struct APRRecord {
        string corridor;
        string emotionalTag;
        uint256 resonanceRate;
        bool ratified;
    }

    APRRecord[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRecord(string memory _corridor, string memory _emotionalTag, uint256 _resonanceRate) external onlyAdmin {
        codex.push(APRRecord(_corridor, _emotionalTag, _resonanceRate, false));
    }

    function ratifyRecord(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getRecord(uint256 index) external view returns (APRRecord memory) {
        return codex[index];
    }
}
