// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailTraderResilienceCodexDAO {
    address public admin;

    struct ResilienceEntry {
        string purokOrBarangay;
        string trainingFocus;
        string resilienceClause;
        string emotionalTag;
        bool enforced;
    }

    ResilienceEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokOrBarangay, string memory _trainingFocus, string memory _resilienceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ResilienceEntry(_purokOrBarangay, _trainingFocus, _resilienceClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return codex[index];
    }
}
