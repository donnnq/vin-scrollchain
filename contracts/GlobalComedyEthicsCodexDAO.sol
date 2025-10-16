// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalComedyEthicsCodexDAO {
    address public admin;

    struct EthicsEntry {
        string comedyLabel;
        string ethicsClause;
        string emotionalTag;
        bool ratified;
    }

    EthicsEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _comedyLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(EthicsEntry(_comedyLabel, _ethicsClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return codex[index];
    }
}
