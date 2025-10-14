// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportResilienceCodexDAO {
    address public admin;

    struct ResilienceEntry {
        string productType;
        string exportMarket;
        string resilienceStrategy;
        string emotionalTag;
        bool activated;
    }

    ResilienceEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productType, string memory _exportMarket, string memory _resilienceStrategy, string memory _emotionalTag) external onlyAdmin {
        codex.push(ResilienceEntry(_productType, _exportMarket, _resilienceStrategy, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        codex[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return codex[index];
    }
}
