// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract THCBeverageRetailCodex {
    address public admin;

    struct BeverageEntry {
        string companyName;
        string productLine;
        string launchRegion;
        string emotionalTag;
        bool summoned;
        bool stocked;
        bool sealed;
    }

    BeverageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBeverage(string memory companyName, string memory productLine, string memory launchRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(BeverageEntry(companyName, productLine, launchRegion, emotionalTag, true, false, false));
    }

    function confirmStocking(uint256 index) external onlyAdmin {
        entries[index].stocked = true;
    }

    function sealBeverageEntry(uint256 index) external onlyAdmin {
        require(entries[index].stocked, "Must be stocked first");
        entries[index].sealed = true;
    }

    function getBeverageEntry(uint256 index) external view returns (BeverageEntry memory) {
        return entries[index];
    }
}
