// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalSupplyChainImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string productType;
        string vulnerabilitySource;
        string immunityStrategy;
        string emotionalTag;
        bool activated;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productType, string memory _vulnerabilitySource, string memory _immunityStrategy, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_productType, _vulnerabilitySource, _immunityStrategy, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        codex[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
