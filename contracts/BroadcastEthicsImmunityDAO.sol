// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastEthicsImmunityDAO {
    address public admin;

    struct EthicsEntry {
        string mediaOutlet;
        string ethicsClause;
        string emotionalTag;
        bool enforced;
    }

    EthicsEntry[] public ethics;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEthics(string memory _mediaOutlet, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        ethics.push(EthicsEntry(_mediaOutlet, _ethicsClause, _emotionalTag, false));
    }

    function enforceEthics(uint256 index) external onlyAdmin {
        ethics[index].enforced = true;
    }

    function getEthics(uint256 index) external view returns (EthicsEntry memory) {
        return ethics[index];
    }
}
