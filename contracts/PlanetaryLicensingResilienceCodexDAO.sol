// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryLicensingResilienceCodexDAO {
    address public admin;

    struct CodexEntry {
        string licenseLabel;
        string resilienceClause;
        string emotionalTag;
        bool sealed;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _licenseLabel, string memory _resilienceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_licenseLabel, _resilienceClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
