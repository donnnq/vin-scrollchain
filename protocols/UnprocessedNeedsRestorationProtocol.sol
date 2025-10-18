// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnprocessedNeedsRestorationProtocol {
    address public admin;

    struct ProductEntry {
        string name;
        string origin;
        string reasonForDisappearance;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool restored;
    }

    ProductEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProduct(string memory name, string memory origin, string memory reasonForDisappearance, string memory emotionalTag) external onlyAdmin {
        entries.push(ProductEntry(name, origin, reasonForDisappearance, emotionalTag, true, false, false));
    }

    function flagProduct(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function restoreProduct(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].restored = true;
    }

    function getProductEntry(uint256 index) external view returns (ProductEntry memory) {
        return entries[index];
    }
}
