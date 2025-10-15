// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string operatorLabel;
        string ethicsClause;
        string emotionalTag;
        bool ratified;
    }

    EthicsEntry[] public ethics;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _operatorLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        ethics.push(EthicsEntry(_operatorLabel, _ethicsClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        ethics[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return ethics[index];
    }
}
