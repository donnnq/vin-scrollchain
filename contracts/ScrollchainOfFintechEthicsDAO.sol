// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfFintechEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string fintechLabel;
        string ethicsClause;
        string emotionalTag;
        bool sealed;
    }

    EthicsEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _fintechLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(EthicsEntry(_fintechLabel, _ethicsClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return codex[index];
    }
}
